import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:letutor/ui/schedule/schedule_controller.dart';

import '../../widgets/app_bar/app_bar_custom.dart';
import '../courses/component/header_courses_component.dart';
import 'component/header_schedule_component.dart';
import 'component/schedule_item.dart';

class Schedule extends GetWidget<ScheduleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(isHaveDrawer: controller.isHaveDrawer),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderScheduleComponent(),
            SizedBox(
              height: 20,
            ),
            ScheduleItem(),
          ],
        ),
      ),
    );
  }
}
