// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/title_string.dart';
import '../../../resources/font/font_text.dart';
import '../../common/box_shadow_component.dart';

class BookingCourseComponent extends StatelessWidget {
  String date;
  String time;
  bool isDisable;

  BookingCourseComponent({
    Key? key,
    required this.date,
    required this.time,
    this.isDisable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BoxShadowComponent(
      width: Get.width,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: text18.copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                time,
                style: text15.copyWith(color: Colors.grey),
              )
            ],
          ),
          SizedBox(
            width: 100,
            height: 30,
            child: TextButton(onPressed: () {}, child: Text(TitleString.book)),
          )
        ],
      ),
    );
  }
}
