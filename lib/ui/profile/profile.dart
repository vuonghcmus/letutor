import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:letutor/ui/profile/profile_controller.dart';

import '../../constants/title_string.dart';
import '../../resources/font/font_text.dart';
import '../../widgets/app_bar/app_bar_custom.dart';
import 'component/header_profile_component.dart';
import 'component/profile_detail_component.dart';

class Profile extends GetWidget<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(isHaveDrawer: controller.isHaveDrawer),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                HeaderProfileComponent(),
                Text(
                  TitleString.account,
                  style: text28.copyWith(
                      color: const Color.fromRGBO(36, 38, 38, 1.0),
                      fontWeight: FontWeight.w700),
                ),
                ProfileDetailComponent(controller: controller,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
