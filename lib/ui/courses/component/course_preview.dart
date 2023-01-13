import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:letutor/config/app_pages.dart';

import '../../../resources/font/font_text.dart';
import '../../../resources/gen/assets.gen.dart';
import '../../common/box_shadow_component.dart';
import 'course_item_preview.dart';

class CoursePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'EngLish For Traveling',
            style: text26,
          ),
          SizedBox(
            height: 20,
          ),
          BoxShadowComponent(
            onTap: () {
              Get.toNamed(AppRoutes.COURSE_DETAIL);
            },
            width: Get.width,
            padding: EdgeInsets.all(10),
            child: CourseItemPreview(
              image: Assets.images.vietnam.image(),
              mainTitle: 'Life in the Internet Age',
              subTitle:
                  'Lets discuss how technology is changing the way we live',
              bottomWidget: Text(
                'Intermediate 9 lessons',
                style: text14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
