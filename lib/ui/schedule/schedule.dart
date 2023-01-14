import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:letutor/ui/schedule/schedule_controller.dart';
import 'package:number_paginator/number_paginator.dart';

import '../../constants/title_string.dart';
import '../../widgets/app_bar/app_bar_custom.dart';
import '../courses/component/header_courses_component.dart';
import 'component/header_schedule_component.dart';
import 'component/schedule_item.dart';

class Schedule extends GetWidget<ScheduleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        isHaveDrawer: controller.isHaveDrawer,
        controller: controller,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              HeaderScheduleComponent(),
              SizedBox(
                height: 20,
              ),
              controller.schedules.isEmpty
                  ? Text(TitleString.noData)
                  : Column(
                      children: [
                        ...controller.schedules.map(
                          (element) => Column(
                            children: [
                              ScheduleItem(
                                schedule: element,
                                controller: controller,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: NumberPaginator(
                      config: NumberPaginatorUIConfig(
                        buttonShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        mode: ContentDisplayMode.numbers,
                      ),
                      onPageChange: (value) {
                        controller.pageSelected.value = value;
                        controller.getData(page: value + 1);
                      },
                      numberPages: controller.totalPage.value,
                      initialPage: controller.pageSelected.value,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
