import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/title_string.dart';
import '../../../resources/font/font_text.dart';
import '../../../resources/gen/assets.gen.dart';
import '../../common/circle_box.dart';

class HeaderScheduleComponent extends StatelessWidget {
  const HeaderScheduleComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleBox(size: 140, child: Assets.svg.calendarCheck.svg()),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TitleString.bookedSchedule,
                style: text26.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                TitleString.hereIsListOfTheTimeslotsYouHaveBooked,
                style: text16.copyWith(fontWeight: FontWeight.w500),
              ),
              Text(
                TitleString
                    .youCanTrackWhenTheLessonStartsJoinTheClassWithOneClickOrCanCancelTheLessonTwoHoursInAdvance,
                style: text16.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
