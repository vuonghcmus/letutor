import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:letutor/config/app_pages.dart';
import 'package:letutor/ui/common/text_field_area_component.dart';

import '../../../constants/title_string.dart';

class LoginComponent extends StatelessWidget {
  const LoginComponent(
      {Key? key,
      required this.titleFormEmail,
      required this.titleHintEmail,
      required this.titleFormPassword,
      required this.titleHintPassword,
      required this.titleButton})
      : super(key: key);
  final String titleFormEmail;
  final String titleHintEmail;
  final String titleFormPassword;
  final String titleHintPassword;
  final String titleButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldAreaComponent(text: titleFormEmail, textHint: titleHintEmail),
        const SizedBox(height: 20),
        TextFieldAreaComponent(
            text: titleFormPassword,
            textHint: titleHintPassword,
            isPassword: true),
        InkWell(
          onTap: () => {
            Get.toNamed(AppRoutes.FORGOT_PASSWORD),
          },
          child: Text(
            TitleString.loginForgotPassword,
            textAlign: TextAlign.left,
          ),
        ),
        OutlinedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)))),
            onPressed: () => {Get.toNamed(AppRoutes.DASH_BOARD_LIST)},
            child:
                Text(titleButton, style: const TextStyle(color: Colors.white)))
      ],
    );
  }
}
