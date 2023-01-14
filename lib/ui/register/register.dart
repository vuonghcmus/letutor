import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:letutor/ui/login/component/login_component.dart';
import 'package:letutor/ui/register/register_controller.dart';

import '../../config/app_pages.dart';
import '../../constants/title_string.dart';
import '../../resources/font/font_text.dart';
import '../../resources/gen/assets.gen.dart';

import '../../widgets/app_bar/app_bar_custom.dart';
import '../login/component/login_title_component.dart';
import '../login/component/sub_login_component.dart';
import 'component/register_component.dart';

class Register extends GetWidget<RegisterController> {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(isHaveDrawer: controller.isHaveDrawer),
      body: ListView(
        children: <Widget>[
          Assets.images.login.image(),
          LoginTitleComponent(title: TitleString.register),
          RegisterComponent(
            titleButton: TitleString.register,
            titleFormEmail: TitleString.loginFormEmail,
            titleHintEmail: TitleString.loginFormHintEmail,
            titleFormPassword: TitleString.loginFormPassword,
            titleHintPassword: TitleString.loginFormHintPassword, registerController: controller,),
          SubLoginComponent(titleBottom: [
            Text(
              TitleString.haveAccount,
              style: text14.copyWith(
                  color: const Color.fromRGBO(36, 38, 38, 1.0),
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: () => {
                Get.toNamed(AppRoutes.LOGIN),
              },
              child: Text(
                style: text14.copyWith(
                    color: const Color.fromRGBO(54, 154, 232, 1.0),
                    fontWeight: FontWeight.w700),
                TitleString.loginTitle,
                textAlign: TextAlign.left,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
