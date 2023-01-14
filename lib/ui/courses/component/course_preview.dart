import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:letutor/config/app_pages.dart';

import '../../../models/course.dart';
import '../../../resources/font/font_text.dart';
import '../../../resources/gen/assets.gen.dart';
import '../../common/box_shadow_component.dart';
import '../../common/image_network_component.dart';
import 'course_item_preview.dart';

class CoursePreview extends StatelessWidget {
  final List<Course> course;
  final String title;

  const CoursePreview({super.key, required this.course, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: text26,
          ),
          SizedBox(
            height: 20,
          ),
          ...course.map(
            (e) => Column(
              children: [
                BoxShadowComponent(
                  onTap: () {
                    Get.toNamed(AppRoutes.COURSE_DETAIL, arguments: [e]);
                  },
                  width: Get.width,
                  padding: EdgeInsets.all(10),
                  child: CourseItemPreview(
                    image: ImageNetworkComponent(
                      url: e.imageUrl,
                    ),
                    mainTitle: e.name,
                    subTitle: e.description,
                    bottomWidget: Text(
                      e.topics.isEmpty
                          ? 'Intermediate'
                          : 'Intermediate ${e.topics.length} lessons',
                      style: text14,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
