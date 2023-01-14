import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/title_string.dart';
import '../../../resources/font/font_text.dart';
import '../../../resources/gen/assets.gen.dart';
import '../../common/circle_box.dart';
import '../../common/text_form_field_custom_component.dart';

class HeaderBecomeTeacherComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleBox(size: 140, child: Assets.images.people.image()),
            Container(
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(TitleString.setUpYourTutorProfile,
                        style: text26.copyWith(
                            fontWeight: FontWeight.w700, color: Colors.black),
                        textAlign: TextAlign.center),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          child: Column(
            children: [
              Text(
                TitleString
                    .yourTutorProfileIsYourChanceToReachStudentsOnTutoringYouCanEditItLaterOnYourProfilePage,
                style: text16.copyWith(
                    fontWeight: FontWeight.w700, color: Colors.black),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                TitleString
                    .newStudentsCanBrowseTutorProfilesToFindATutorThatMatchesTheirAcademicGoalsAndPersonalityWhenAStudentReturnsTheyCanSearchFromTheTutorProfileWhoIsReadyToGiveThemAGreatExperience,
                style: text16.copyWith(
                    fontWeight: FontWeight.w700, color: Colors.black),
              )
            ],
          ),
        )
      ],
    );
  }
}
