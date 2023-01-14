import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:letutor/ui/review/review_controller.dart';
import 'package:number_paginator/number_paginator.dart';

import '../../constants/title_string.dart';
import '../../resources/font/font_text.dart';
import '../../widgets/app_bar/app_bar_custom.dart';
import '../common/circle_box.dart';
import '../common/image_network_component.dart';

class ReviewPage extends GetWidget<ReviewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(isHaveDrawer: controller.isHaveDrawer, controller: controller,),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    ...controller.reviews.map(
                      (e) => Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleBox(
                                size: 40,
                                child: ImageNetworkComponent(
                                    url: e.firstInfo?.avatar ?? '')),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      e.firstInfo?.name ?? TitleString.noName,
                                      style: text15.copyWith(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      e.createdAt.toString() ?? 'No date',
                                      style:
                                          text13.copyWith(color: Colors.grey),
                                    )
                                  ],
                                ),
                                RatingBar.builder(
                                  initialRating: e.rating.toDouble() ?? 0,
                                  minRating: 0,
                                  maxRating: 5,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 15,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 3.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 5,
                                  ),
                                  onRatingUpdate: (rating) {},
                                ),
                                SizedBox(
                                  width: Get.width - 100,
                                  child: Text(
                                    e.content,
                                    style: text13,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: NumberPaginator(
                            config: NumberPaginatorUIConfig(
                              buttonShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              mode: ContentDisplayMode.numbers,
                            ),
                            onPageChange: (value) {
                              controller.pageSelected.value = value;
                              controller.getData(page: value + 1);
                            },
                            numberPages: controller.totalPage.value,
                            initialPage: controller.pageSelected.value,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
