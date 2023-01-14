import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:letutor/config/app_pages.dart';

import '../../../constants/title_string.dart';
import '../../../resources/font/font_text.dart';
import '../dash_board_list_controller.dart';
import 'package:intl/intl.dart';

class HeaderDashBoardComponent extends StatelessWidget {
  // final controller = Get.find<DashBoardListController>();
  final DashBoardListController controller;

  HeaderDashBoardComponent({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            TitleString.dashBoardUpComing,
            style: text28.copyWith(
                fontWeight: FontWeight.w700, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              Text(
                DateFormat('dd/MM/yyyy').format(DateTime.now()),
                textAlign: TextAlign.center,
                style: text18.copyWith(color: Colors.white),
              ),
              Obx(
                () => Text(
                  '(còn ' + controller.upComming.value + ')',
                  style: text16.copyWith(color: Colors.amber),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Obx(
            () => Text(
              '${TitleString.dashBoardTotalTime} ${controller.totalTime.value ~/ 60} ${TitleString.hours} ${controller.totalTime.value % 60} ${TitleString.minutes}',
              textAlign: TextAlign.center,
              style: text18.copyWith(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextButton(
              onPressed: () {
                Get.toNamed(AppRoutes.SCHEDULE);
              },
              child: Text(TitleString.dashBoardEnterRoom),
            ),
          ),
        ],
      ),
    );
  }
}
