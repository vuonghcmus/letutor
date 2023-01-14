import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:letutor/ui/change_password/change_password_controller.dart';

import '../../constants/title_string.dart';
import '../../resources/font/font_text.dart';
import '../../widgets/app_bar/app_bar_custom.dart';
import '../common/button_custom_component.dart';
import '../common/text_field_area_component.dart';

class ChangePassword extends GetWidget<ChangePasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(isHaveDrawer: controller.isHaveDrawer),
      body: Center(
        child: Container(
          child: ListView(
            children: [
              Text(
                TitleString.changePassword,
                style: text28.copyWith(
                    color: Colors.black, fontWeight: FontWeight.w700),
              ),
              TextFieldAreaComponent(

                  text: TitleString.currentPassword,
                  textHint: '',
                  isPassword: true),
              TextFieldAreaComponent(
                  text: TitleString.newPassword,
                  textHint: '',
                  isPassword: true),
              TextFieldAreaComponent(
                  text: TitleString.confirmNewPassword,
                  textHint: '',
                  isPassword: true),
              ButtonCustomComponent(
                  title: TitleString.confirm, onPressed: () => {})
            ],
          ),
        ),
      ),
    );
  }
}
