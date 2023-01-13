import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/title_string.dart';
import '../../../resources/font/font_text.dart';
import '../../common/text_container_component.dart';
import '../../common/text_form_field_custom_component.dart';
import '../dash_board_list_controller.dart';

class FilterTutorArea extends StatelessWidget {
  const FilterTutorArea({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DashBoardListController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TitleString.dashBoardFindTutor,
          style:
              text28.copyWith(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: Get.width / 2 + 25,
          child: TextFormFieldCustomComponent(
              radius: 20,
              onChanged: (value) {},
              controller: null,
              hintText: TitleString.dashBoardEnterTutorName),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: Get.width / 2 - 25,
          child: TextFormFieldCustomComponent(
              radius: 20,
              onChanged: (value) {},
              controller: null,
              hintText: TitleString.dashBoardSelectTutorNation),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          TitleString.dashBoardSelectAvailableTime,
          style: text16.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: Get.width / 2 - 15,
          child: TextFormFieldCustomComponent(
              radius: 20,
              onChanged: (value) {},
              controller: null,
              hintText: TitleString.dashBoardSelectDay),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: Get.width / 4 * 3,
          child: TextFormFieldCustomComponent(
              radius: 20,
              onChanged: (value) {},
              controller: null,
              hintText:
                  '${TitleString.dashBoardStartTime} -> ${TitleString.dashBoardEndTime}'),
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          spacing: 5,
          runSpacing: 20,
          children: [
            ...controller.listType
                .map((e) => TextContainerComponent(
                      title: e,
                    ))
                .toList()
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        TextContainerComponent(
          title: TitleString.dashBoardResetFilter,
          color: Colors.white,
          borderColor: const Color.fromRGBO(1, 80, 245, 0.5019607843137255),
          textColor: const Color.fromRGBO(1, 80, 245, 0.5019607843137255),
        )
      ],
    );
  }
}
