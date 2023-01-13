import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:letutor/config/app_pages.dart';
import 'package:letutor/ui/common/box_shadow_component.dart';

import '../../constants/title_string.dart';
import '../../resources/font/font_text.dart';
import '../../resources/gen/assets.gen.dart';
import '../../widgets/app_bar/app_bar_custom.dart';
import '../courses/component/course_item_preview.dart';
import 'component/overview_detail_course.dart';
import 'component/sub_course_detail_component.dart';
import 'course_detail_controller.dart';

class CourseDetail extends GetWidget<CourseDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(isHaveDrawer: controller.isHaveDrawer),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: BoxShadowComponent(
                width: double.infinity,
                child: CourseItemPreview(
                  image: Assets.images.vietnam.image(),
                  mainTitle: 'Viet Nam',
                  subTitle: 'Viet Nam',
                  bottomWidget: Text(
                    'Intermediate 9 lessons',
                    style: text14,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SubCourseDetailComponent(
              title: TitleString.overview,
              children: [
                OverviewDetailCourse(
                  title: 'Tại sao bạn nên học khóa học này',
                  content:
                      'Our world is rapidly changing thanks to new technology, and the vocabulary needed to discuss modern life is evolving almost daily. In this course you will learn the most up-to-date terminology from expertly crafted lessons as well from your native-speaking tutor.',
                ),
                SizedBox(
                  height: 10,
                ),
                OverviewDetailCourse(
                  title: 'Bạn có thể làm gì',
                  content:
                      'You will learn vocabulary related to timely topics like remote work, artificial intelligence, online privacy, and more. In addition to discussion questions, you will practice intermediate level speaking tasks such as using data to describe trends.',
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SubCourseDetailComponent(
              title: TitleString.requireLevel,
              children: [
                Row(
                  children: [
                    Icon(Icons.person_add_alt_1_sharp),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Intermediate',
                      style: text14,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SubCourseDetailComponent(
              title: TitleString.courseLength,
              children: [
                Row(
                  children: [
                    Icon(Icons.topic),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '9 chủ đề',
                      style: text14,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SubCourseDetailComponent(
              title: TitleString.topicList,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      ...[1, 2, 3, 4, 5].map(
                        (e) => BoxShadowComponent(
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Text(
                                e.toString() + '.',
                                style: text14.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              Text(
                                'Topic ' + e.toString(),
                                style: text14.copyWith(
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SubCourseDetailComponent(
              title: TitleString.teacherSuggestion,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Text(
                            'Quan dz',
                            style: text14.copyWith(fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(AppRoutes.TEACHER_DETAIL);
                            },
                            child: Text(
                              'Xem thêm',
                              style:
                                  text14.copyWith(fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
