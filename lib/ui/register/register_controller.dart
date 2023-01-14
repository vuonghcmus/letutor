import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../config/app_pages.dart';
import '../../constants/constants.dart';
import '../../services/user_services.dart';
import '../../utils/validation.dart';
import '../../widgets/notify/notify_bar.dart';
import '../base/base_controller.dart';

class RegisterController extends BaseController{

  final _userService = Get.find<UserService>();

  final Map<String, TextEditingController> controllers = Map.fromEntries(
    [
      emailField,
      passwordField,
    ].map(
          (value) => MapEntry(
        value,
        TextEditingController(),
      ),
    ),
  );

  @override
  void onInit() {
    super.onInit();
    isHaveDrawer = false;
  }

  void register() async{
    print(controllers[emailField]!.text);
    print(controllers[passwordField]!.text);
    validatorEmpty(controllers.values.toList());
    try {
      await _userService.registerAccount(
          email: controllers[emailField]!.text,
          password: controllers[passwordField]!.text);
    } on DioError catch (e) {
      notifyBar(message: e.response?.data['message'], isSuccess: false);
      return;
    }
    notifyBar(message: 'Please confirm email', isSuccess: true);
    Get.offNamed(AppRoutes.LOGIN);
  }
}