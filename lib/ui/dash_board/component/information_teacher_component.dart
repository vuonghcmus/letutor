import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../config/app_pages.dart';
import '../../../constants/title_string.dart';
import '../../../resources/font/font_text.dart';
import '../../../resources/gen/assets.gen.dart';
import '../../common/box_shadow_component.dart';
import '../../common/circle_box.dart';
import '../../common/text_container_component.dart';
import '../dash_board_list_controller.dart';

class InformationTeacherComponent extends StatelessWidget {
  double countRating;

  InformationTeacherComponent({
    Key? key,
    required this.countRating,
    required this.controller,
  }) : super(key: key);

  final DashBoardListController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3),
          child: BoxShadowComponent(
              padding: EdgeInsets.all(30),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              width: Get.width - 20 - 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleBox(
                      size: 80,
                      child: Assets.images.vietnam.image(fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Viet Nam',
                    style: text20.copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Assets.svg.vietnam.svg(height: 15, width: 25),
                      SizedBox(width: 15),
                      Text(
                        'Viet Nam',
                        style: text16,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  countRating == 0
                      ? Text(
                          TitleString.dashBoardNoReview,
                          style: text16.copyWith(color: Colors.grey),
                        )
                      : RatingBar.builder(
                          initialRating: countRating,
                          minRating: countRating,
                          maxRating: countRating,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 20,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 5,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                  SizedBox(
                    height: 15,
                  ),
                  Wrap(
                    spacing: 5,
                    runSpacing: 10,
                    children: [
                      ...controller.listType
                          .map((e) => TextContainerComponent(
                                title: e,
                                textColor: Colors.indigo,
                                color: Colors.cyan,
                              ))
                          .toList()
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: Get.width / 2 - 30,
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.TEACHER_DETAIL);
                        },
                        child: TextContainerComponent(
                          title: TitleString.book,
                          textColor: Colors.indigo,
                          color: Colors.cyan,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              )),
        ),
        Positioned(
            right: 30,
            top: 30,
            child: const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 25,
            ))
      ],
    );
  }
}
