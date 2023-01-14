import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/title_string.dart';
import '../../../models/schedule.dart';
import '../../../resources/font/font_text.dart';
import '../../common/box_shadow_component.dart';
import '../teacher_detail_controller.dart';

class BookingCourseComponent extends StatelessWidget {
  String date;
  String time;
  bool isDisable;
  bool isBooked;
  Schedule schedule;
  final controller = Get.find<TeacherDetailController>();

  BookingCourseComponent({
    Key? key,
    required this.date,
    required this.time,
    this.isDisable = false,
    this.isBooked = false,
    required this.schedule,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BoxShadowComponent(
          width: Get.width,
          padding: EdgeInsets.all(10),
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
                child: !isBooked && !isDisable
                    ? TextButton(
                        onPressed: () {
                          controller.book(schedule.scheduleDetails[0].id);
                        }, child: Text(TitleString.book))
                    : TextButton(
                        onPressed: () {}, child: Text("Đã được đặt")),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
