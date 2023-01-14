import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:letutor/ui/teacher_detail/teacher_detail_controller.dart';

import '../../../config/app_pages.dart';
import '../../../constants/title_string.dart';
import '../../../resources/font/font_text.dart';
import '../../../resources/gen/assets.gen.dart';
import '../../common/circle_box.dart';
import '../../common/image_network_component.dart';
import '../../common/text_icon_component.dart';

class TeacherInformationComponent extends StatelessWidget {
  final TeacherDetailController controller;

  const TeacherInformationComponent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleBox(
                    size: 110,
                    child: ImageNetworkComponent(
                      url: controller.tutor.value.userModel?.avatar ?? "",
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.tutor.value.userModel?.name ??
                          TitleString.noName,
                      style: text20.copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RatingBar.builder(
                      initialRating: 4,
                      minRating: 4,
                      maxRating: 4,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 5,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Assets.svg.vietnam.svg(height: 15, width: 25),
                        SizedBox(width: 15),
                        Text(
                          controller.tutor.value.userModel?.country ??
                              "No country",
                          style: text16,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            controller.tutor.value.bio ?? "No bio",
            style: text16.copyWith(color: Colors.grey),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextIconComponent(
                iconData: Icons.favorite,
                title: TitleString.favorite,
              ),
              TextIconComponent(
                iconData: Icons.report,
                title: TitleString.report,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.REVIEW,
                      arguments: {'id': controller.tutor.value.userModel!.id});
                },
                child: TextIconComponent(
                  iconData: Icons.star,
                  title: TitleString.reviews,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
