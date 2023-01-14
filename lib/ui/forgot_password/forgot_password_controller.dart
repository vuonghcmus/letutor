import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../config/app_pages.dart';
import '../../constants/constants.dart';
import '../../services/user_services.dart';
import '../../utils/validation.dart';
import '../../widgets/notify/notify_bar.dart';
import '../base/base_controller.dart';

class ForgotPasswordController extends BaseController {
  final _userService = Get.find<UserService>();

  final Map<String, TextEditingController> controllers = Map.fromEntries(
    [
      emailField,
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

  void forgotPassword() async {
    validatorEmpty(controllers.values.toList());
    print(controllers[emailField]!.text);
    try {
      await _userService.forgotPassword(email: controllers[emailField]!.text);
    } on DioError catch (e) {
      notifyBar(message: e.response?.data['message'], isSuccess: false);
    }
    notifyBar(message: 'Please confirm email', isSuccess: true);
    Get.offNamed(AppRoutes.LOGIN);
  }
}
