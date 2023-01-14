import 'dart:io';

import 'package:cross_file/src/types/interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../constants/constants.dart';
import '../../models/user_model.dart';
import '../../services/user_services.dart';
import '../../utils/date_time.dart';
import '../../widgets/notify/notify_bar.dart';
import '../base/base_controller.dart';
import '../controllers/app_controller.dart';

class ProfileController extends BaseController {
  final _appController = Get.find<AppController>();
  final _userService = Get.find<UserService>();
  final Map<String, TextEditingController> controllers = Map.fromEntries(
    [
      nameField,
      emailField,
      countryField,
      phoneField,
      birthdayField,
      levelField,
      //wantToLearnField
      studyScheduleField,
    ].map(
      (value) => MapEntry(
        value,
        TextEditingController(),
      ),
    ),
  );
  List<String> wantToLearnField = [];
  Rx<UserModel> user = UserModel(birthday: DateTime(1990)).obs;

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    setUpDataProfile();
  }

  @override
  void onReloadData() {}

  void setUpDataProfile() async {
    await _userService.getUserInfo();
    user.value = _appController.userModel.value!;

    controllers[nameField]?.text = user.value.name;
    controllers[emailField]?.text = user.value.email;
    controllers[countryField]?.text = user.value.country;
    controllers[phoneField]?.text = user.value.phone;
    controllers[birthdayField]?.text =
        DateFormat(time1).format(user.value.birthday);
    controllers[levelField]?.text = user.value.level;
    controllers[studyScheduleField]?.text = user.value.studySchedule;
    isLoading.value = false;
  }

  void uploadImage(String path) async {
    await _userService.uploadImage(File(path));
    isLoading.value = true;
    setUpDataProfile();
  }

  void updateProfile() async {
    {
      UserModel userModel = UserModel(
        name: controllers[nameField]!.value.text,
        // email: controllers[emailField]!.value.text,
        country: controllers[countryField]!.value.text,
        phone: controllers[phoneField]!.value.text,
        birthday: controllers[birthdayField]?.text != null
            ? DateTime.parse(controllers[birthdayField]!.value.text)
            : DateTime(1990),
        level: controllers[levelField]!.value.text,
        studySchedule: controllers[studyScheduleField]!.value.text,
      );
      await _userService.updateUserInfo(user: userModel);
      // setUpDataProfile();
      notifyBar(message: 'Cập nhật thành công', isSuccess: true);
    }
  }

  Map<String, String> learnTopics = {
    '3': 'English for kids',
    '4': 'Business English',
    '5': 'Conversational English'
  };

  Map<String, String> testPreparations = {
    '1': 'STARTERS',
    '2': 'MOVIERS',
    '3': 'FLYERS'
  };

}
