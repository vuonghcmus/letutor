// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:letutor/ui/schedule/schedule_controller.dart';

import '../../widgets/app_bar/app_bar_custom.dart';
import 'component/header_schedule_component.dart';
import 'component/schedule_item.dart';

class Schedule extends GetWidget<ScheduleController> {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(isHaveDrawer: controller.isHaveDrawer),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderScheduleComponent(),
            const SizedBox(
              height: 20,
            ),
            const ScheduleItem(),
          ],
        ),
      ),
    );
  }
}
