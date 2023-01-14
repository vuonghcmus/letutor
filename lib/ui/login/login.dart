import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:letutor/ui/login/login_controller.dart';

import '../../config/app_pages.dart';
import '../../constants/title_string.dart';
import '../../resources/font/font_text.dart';
import '../../resources/gen/assets.gen.dart';

import '../../widgets/app_bar/app_bar_custom.dart';
import 'component/login_component.dart';
import 'component/login_title_component.dart';
import 'component/sub_login_component.dart';

class Login extends GetWidget<LoginController> {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(isHaveDrawer: controller.isHaveDrawer),
      body: ListView(
        children: <Widget>[
          Assets.images.login.image(),
          LoginTitleComponent(title: TitleString.loginTitle),
          LoginComponent(
              loginController: controller,
              titleButton: TitleString.loginButton,
              titleFormEmail: TitleString.loginFormEmail,
              titleHintEmail: TitleString.loginFormHintEmail,
              titleFormPassword: TitleString.loginFormPassword,
              titleHintPassword: TitleString.loginFormHintPassword),
          SubLoginComponent(titleBottom: [
            Text(
              TitleString.noAccount,
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
                Get.toNamed(AppRoutes.REGISTER),
              },
              child: Text(
                style: text14.copyWith(
                    color: const Color.fromRGBO(54, 154, 232, 1.0),
                    fontWeight: FontWeight.w700),
                TitleString.register,
                textAlign: TextAlign.left,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
