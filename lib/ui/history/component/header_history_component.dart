import 'package:flutter/cupertino.dart';

import '../../../constants/title_string.dart';
import '../../../resources/font/font_text.dart';
import '../../../resources/gen/assets.gen.dart';
import '../../common/circle_box.dart';

class HeaderHistoryComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleBox(size: 140, child: Assets.svg.historyLogo.svg()),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TitleString.historySchedule,
                style: text26.copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                TitleString.hereIsListOfLessonsYouHaveTaken,
                style: text16.copyWith(fontWeight: FontWeight.w500),
              ),
              Text(
                TitleString.youCanReviewDetailsOfLessonYouHaveAttached,
                style: text16.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),

      ],
    );
  }
}