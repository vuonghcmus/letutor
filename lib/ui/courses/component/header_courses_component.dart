import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/title_string.dart';
import '../../../resources/font/font_text.dart';
import '../../../resources/gen/assets.gen.dart';
import '../../common/circle_box.dart';
import '../../common/text_form_field_custom_component.dart';
import '../courses_controller.dart';

class HeaderCoursesComponent extends StatelessWidget {
  final controller = Get.find<CoursesController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleBox(size: 140, child: Assets.svg.course.svg()),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Text(
                    TitleString.discoverCourses,
                    style: text22.copyWith(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormFieldCustomComponent(
                      onChanged: (value) {},
                      controller: controller.textController,
                      hintText: TitleString.course,
                      icon: InkWell(
                        onTap: () {
                          controller.setUpData(page: 1);
                        },
                        child: Icon(
                          Icons.search,
                          size: 15,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
