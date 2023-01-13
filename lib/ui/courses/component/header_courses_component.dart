import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/title_string.dart';
import '../../../resources/font/font_text.dart';
import '../../../resources/gen/assets.gen.dart';
import '../../common/circle_box.dart';
import '../../common/text_form_field_custom_component.dart';

class HeaderCoursesComponent extends StatelessWidget {
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
                    style: text26.copyWith(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormFieldCustomComponent(
                      onChanged: (value) {},
                      controller: null,
                      hintText: TitleString.course,
                      icon: Icon(
                        Icons.search,
                        size: 15,
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
