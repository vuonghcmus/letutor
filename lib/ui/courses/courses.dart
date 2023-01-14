import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../constants/title_string.dart';
import '../../resources/font/font_text.dart';
import '../../widgets/app_bar/app_bar_custom.dart';
import '../common/text_form_field_custom_component.dart';
import 'component/header_courses_component.dart';
import 'component/search_courses_component.dart';
import 'component/tab_courses_view.dart';
import 'courses_controller.dart';

class Courses extends GetWidget<CoursesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(isHaveDrawer: controller.isHaveDrawer),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderCoursesComponent(),
            SizedBox(
              height: 20,
            ),
            Text(
              TitleString.courseDescription,
              style: text15.copyWith(
                  color: Colors.black, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 20,
            ),
            //search courses
            SearchCoursesComponent(),
            SizedBox(
              height: 20,
            ),
            TabCourseView(controller: controller),
            SizedBox(
              height: 20,
            ),

          ],
        ),
      ),
    );
  }
}
