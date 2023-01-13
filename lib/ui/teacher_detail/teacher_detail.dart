import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:letutor/widgets/app_bar/app_bar_custom.dart';

import 'component/booking_course_component.dart';
import 'component/teacher_detail_component.dart';
import 'component/teacher_information_component.dart';
import 'component/teacher_video_component.dart';
import 'teacher_detail_controller.dart';

class TeacherDetail extends GetWidget<TeacherDetailController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(isHaveDrawer: controller.isHaveDrawer),
      body: Center(
        child : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TeacherInformationComponent(),
              TeacherVideoComponent(controller: controller),
              SizedBox(
                height: 20,
              ),
              TeacherDetailComponent(controller: controller),
              SizedBox(
                height: 20,
              ),
              BookingCourseComponent(
                date: '20/10 Thu',
                time: '00:00 - 00:25',
              ),
              SizedBox(
                height: 10,
              ),
              BookingCourseComponent(
                date: '21/10 Fri',
                time: '00:00 - 00:25',
              ),
            ],
          ),
        )

      ),
    );
  }
}
