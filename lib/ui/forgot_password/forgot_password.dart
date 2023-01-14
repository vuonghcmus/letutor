import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:letutor/config/app_pages.dart';

import '../../constants/constants.dart';
import '../../constants/title_string.dart';
import '../../resources/font/font_text.dart';
import '../../widgets/app_bar/app_bar_custom.dart';
import '../common/button_custom_component.dart';
import '../common/text_field_area_component.dart';
import 'forgot_password_controller.dart';

class ForgotPassword extends GetWidget<ForgotPasswordController> {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(isHaveDrawer: controller.isHaveDrawer),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Text(
                TitleString.resetPassword,
                style: text28.copyWith(
                    color: const Color.fromRGBO(36, 38, 38, 1.0),
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              Text(
                TitleString.pleaseEnterYourEmailToSearchYourAccount,
                style: text14.copyWith(
                    color: const Color.fromRGBO(36, 38, 38, 1.0),
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextFieldAreaComponent(
                  controller: controller.controllers[emailField],
                  text: TitleString.loginFormEmail,
                  textHint: '',
                  isPassword: false),
              ButtonCustomComponent(
                  title: TitleString.resetPassword,
                  onPressed: () => {controller.forgotPassword()})
            ],
          ),
        ));
  }
}
