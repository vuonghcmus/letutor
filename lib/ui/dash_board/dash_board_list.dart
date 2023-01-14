import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';

import '../../constants/title_string.dart';
import '../../resources/font/font_text.dart';
import '../../widgets/app_bar/app_bar_custom.dart';
import 'component/filter_tutor_area_component.dart';
import 'component/header_dash_board_component.dart';
import 'component/information_teacher_component.dart';
import 'dash_board_list_controller.dart';

class DashBoardList extends GetWidget<DashBoardListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        isHaveDrawer: controller.isHaveDrawer,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderDashBoardComponent(controller: controller),
            SizedBox(
              height: 30,
            ),
            FilterTutorArea(controller: controller),
            ElevatedButton(
              onPressed: () => controller.search(),
              child: Text(TitleString.search),
            ),
            SizedBox(
              height: 30,
            ),
            Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TitleString.dashBoardRecommendTutor,
                    style: text20.copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ...controller.listTutor.map(
                    (element) => InformationTeacherComponent(
                      tutor: element,
                      controller: controller,
                      countRating: element.rating,
                    ),
                  ),
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
