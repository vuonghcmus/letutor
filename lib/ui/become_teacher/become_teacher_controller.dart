import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:letutor/constants/title_string.dart';

import '../../constants/constants.dart';
import '../../models/certifications.dart';
import '../../models/user_model.dart';
import '../../services/become_teacher_services.dart';
import '../../services/user_services.dart';
import '../../widgets/notify/notify_bar.dart';
import '../base/base_controller.dart';
import '../controllers/app_controller.dart';

class BecomeTeacherController extends BaseController {
  RxBool isLoading = false.obs;

  final BecomeTeacherServices _becomeTeacherServices =
      Get.find<BecomeTeacherServices>();
  final _userService = Get.find<UserService>();
  final _appController = Get.find<AppController>();

  final Map<String, TextEditingController> controllers = Map.fromEntries(
    [
      name,
      birthdayField,
      country,
      interests,
      education,
      experience,
      profession,
      bio,
      specialties,
      price
    ].map(
      (value) => MapEntry(
        value,
        TextEditingController(),
      ),
    ),
  );

  final Map<String, String> targetStudentMap = {
    TitleString.beginner: 'beginner',
    TitleString.intermediate: 'intermediate',
    TitleString.advanced: 'advanced',
  };
  final Map<String, String> specialtiesMap = {
    TitleString.englishForKids: 'english-for-kids',
    TitleString.englishForBusiness: 'business-english',
    TitleString.conversational: 'conversational-english',
    TitleString.starters: 'starters',
    TitleString.movers: 'movers',
    TitleString.flyers: 'flyers',
    TitleString.ket: 'ket',
    TitleString.pet: 'pet',
    TitleString.ielts: 'ielts',
    TitleString.toefl: 'toefl',
    TitleString.toeic: 'toeic'
  };
  final Map<String, bool> targetStudentMapSelected = {
    TitleString.beginner: false,
    TitleString.intermediate: false,
    TitleString.advanced: false,
  };

  final Map<String, bool> specialtiesMapSelected = {
    TitleString.englishForKids: false,
    TitleString.englishForBusiness: false,
    TitleString.conversational: false,
    TitleString.starters: false,
    TitleString.movers: false,
    TitleString.flyers: false,
    TitleString.ket: false,
    TitleString.pet: false,
    TitleString.ielts: false,
    TitleString.toefl: false,
    TitleString.toeic: false,
  };

  List<String> languagesTeachSelected = [];

  Certification? certificationHandle;

  RxList<Certification> certificationsSelected = <Certification>[].obs;

  File? fileAvatar;
  Rx<UserModel> user = UserModel(birthday: DateTime(1990)).obs;

  @override
  void onInit() {
    isLoading = true.obs;
    _userService.getUserInfo().then((value) => user.value = value);
    controllers[name]?.text = user.value.name;
    user = _appController.userModel.value!.obs;
    isLoading = false.obs;
    super.onInit();
  }

  Future<int> setUpdata() async {
    return 1;
  }

  void doRegisterBecomeTeacher() {
    String targetStudent = '';
    for (MapEntry<String, bool> item in targetStudentMapSelected.entries) {
      if (item.value) {
        targetStudent = targetStudentMap[item.key]!;
        break;
      }
    }
    List<String> specialties = [];
    for (MapEntry<String, bool> item in specialtiesMapSelected.entries) {
      if (item.value) {
        specialties.add(specialtiesMap[item.key]!);
      }
    }

    try {
      _becomeTeacherServices.becomeTeacher(
          fileAvatar!,
          controllers[name]!.text,
          controllers[country]!.text,
          controllers[birthdayField]!.text,
          controllers[interests]!.text,
          controllers[education]!.text,
          controllers[experience]!.text,
          languagesTeachSelected,
          controllers[bio]!.text,
          targetStudent,
          controllers[profession]!.text,
          fileAvatar!,
          specialties,
          5000,
          certificationsSelected);
      notifyBar(message: 'Register success!', isSuccess: true);
    } on DioError catch (e) {
      notifyBar(message: e.response?.data['message'], isSuccess: false);

      return;
    }
  }
}
