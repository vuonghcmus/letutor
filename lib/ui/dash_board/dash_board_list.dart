import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';

import '../../constants/title_string.dart';
import '../../resources/font/font_text.dart';
import '../../widgets/app_bar/app_bar_custom.dart';
import 'component/filter_tutor_area_component.dart';
import 'component/header_dash_board_component.dart';
import 'component/information_teacher_component.dart';
import 'dash_board_list_controller.dart';

// ignore: use_key_in_widget_constructors
class DashBoardList extends GetWidget<DashBoardListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(isHaveDrawer: controller.isHaveDrawer),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderDashBoardComponent(),
            const SizedBox(
              height: 30,
            ),
            FilterTutorArea(controller: controller),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TitleString.dashBoardRecommendTutor,
                  style: text20.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                InformationTeacherComponent(
                  controller: controller,
                  countRating: 0,
                ),
                const SizedBox(
                  height: 15,
                ),
                InformationTeacherComponent(
                  controller: controller,
                  countRating: 4,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
