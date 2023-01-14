import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../config/app_pages.dart';
import '../../constants/api_constants.dart';
import '../../constants/constants.dart';
import '../../services/rest_client.dart';
import '../../services/user_services.dart';
import '../../utils/validation.dart';
import '../../widgets/notify/notify_bar.dart';
import '../base/base_controller.dart';

class LoginController extends BaseController {
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

  final Map<String, bool> mapCheckInformation = {
    emailField: false,
    passwordField: false,
  };

  String? Function(String?) validator(
      {required String? Function(dynamic value) func, required String key}) {
    return (value) {
      String? result = func(value);
      mapCheckInformation[key] = result != null ? false : true;
      return result;
    };
  }

  @override
  void onInit() {
    super.onInit();
    isHaveDrawer = false;
  }

  void login() async {

    validatorEmpty(controllers.values.toList());
    // if (!checkRegisterAvailable(mapCheckInformation)) {
    //   return;
    // }
    try {
      await _userService.loginAccount(
          email: controllers[emailField]!.text,
          password: controllers[passwordField]!.text);
    } on DioError catch (e) {
      notifyBar(message: e.response?.data['message'], isSuccess: false);

      return;
    }
    Get.offNamed(AppRoutes.DASH_BOARD_LIST);
  }
}
