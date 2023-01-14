import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/title_string.dart';
import '../../../resources/font/font_text.dart';
import '../../common/list_selection_component.dart';
import '../../common/text_container_component.dart';
import '../teacher_detail_controller.dart';

class TeacherDetailComponent extends StatelessWidget {
  final TeacherDetailController controller;

  TeacherDetailComponent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListSelectionComponent(
          title: TitleString.languages,
          child: TextContainerComponent(
            title: controller.tutor.value.languages,
            color: Colors.blue,
            textColor: Colors.black,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ListSelectionComponent(
          title: TitleString.specialized,
          child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: [
              ...controller.listSpecial.map(
                (e) => TextContainerComponent(
                  title: e,
                  color: Colors.blue,
                  textColor: Colors.black,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ListSelectionComponent(
          title: TitleString.interests,
          child: Text(
            controller.tutor.value.interests,
            style: text15.copyWith(color: Colors.grey),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ListSelectionComponent(
          title: TitleString.experience,
          child: Text(
            controller.tutor.value.experience,
            style: text15.copyWith(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
