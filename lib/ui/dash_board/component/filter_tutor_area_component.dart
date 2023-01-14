import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

import '../../../constants/constants.dart';
import '../../../constants/title_string.dart';
import '../../../resources/font/font_text.dart';
import '../../common/text_container_component.dart';
import '../../common/text_field_area_component.dart';
import '../../common/text_form_field_custom_component.dart';
import '../dash_board_list_controller.dart';

class FilterTutorArea extends StatefulWidget {
  const FilterTutorArea({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DashBoardListController controller;

  @override
  State<FilterTutorArea> createState() => _FilterTutorAreaState();
}

class _FilterTutorAreaState extends State<FilterTutorArea> {
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
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: Get.width / 2 + 25,
          child: TextFormFieldCustomComponent(
              radius: 20,
              onChanged: (value) {},
              controller: widget.controller.controllers[nameField],
              hintText: TitleString.dashBoardEnterTutorName),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: Get.width / 2,
          child: MultiSelectDialogField(
            initialValue: [],
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            buttonText: Text(TitleString.dashBoardSelectTutorNation),
            title: Text(TitleString.dashBoardSelectTutorNation),
            items: widget.controller.listNation
                .map((e) => MultiSelectItem(e, e))
                .toList(),
            onConfirm: (values) {
              values.forEach((element) {
                widget.controller.valueContriesSelected.add(element);
                widget.controller.nationality[element] = true;
              });
            },
            listType: MultiSelectListType.CHIP,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          TitleString.dashBoardSelectAvailableTime,
          style: text16.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: Get.width / 2 - 15,
          child: TextFormFieldCustomComponent(
            radius: 20,
            onTap: () {
              showDatePicker(
                      initialDatePickerMode: DatePickerMode.day,
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2001),
                      lastDate: DateTime(2050))
                  .then((value) => {
                        widget.controller.controllers[dateField]?.text =
                            value.toString()
                      });
            },
            readOnly: true,
            controller: widget.controller.controllers[dateField],
            hintText: TitleString.dashBoardSelectDay,
            onChanged: (String) {},
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: Get.width / 2 - 15,
          child: TextFormFieldCustomComponent(
            radius: 20,
            onTap: () {
              showTimePicker(context: context, initialTime: TimeOfDay.now())
                  .then((value) => {
                        widget.controller.controllers[dateStartField]?.text =
                            value?.format(context)?.tr ?? ""
                      });
            },
            readOnly: true,
            controller: widget.controller.controllers[dateStartField],
            hintText: TitleString.dashBoardStartTime,
            onChanged: (String) {},
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: Get.width / 2 - 15,
          child: TextFormFieldCustomComponent(
            radius: 20,
            onTap: () {
              showTimePicker(context: context, initialTime: TimeOfDay.now())
                  .then((value) => {
                        widget.controller.controllers[dateEndField]?.text =
                            value?.format(context)?.tr ?? ""
                      });
            },
            readOnly: true,
            controller: widget.controller.controllers[dateEndField],
            hintText: TitleString.dashBoardEndTime,
            onChanged: (String) {},
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Wrap(
          spacing: 5,
          runSpacing: 20,
          children: [
            ...widget.controller.listType
                .map(
                  (e) => InkWell(
                    onTap: () {
                      widget.controller.currentType = e.obs;
                      setState(() {
                        widget.controller.pageSelected.value = 0;
                        widget.controller.search();
                        widget.controller.update();
                      });
                    },
                    child: TextContainerComponent(
                      title: e,
                      color: widget.controller.currentType.value == e
                          ? Colors.blue
                          : Colors.white,
                    ),
                  ),
                )
                .toList()
          ],
        ),
        SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            setState(() {
              widget.controller.clearSearch();
            });
          },
          child: TextContainerComponent(
            title: TitleString.dashBoardResetFilter,
            color: Colors.white,
            borderColor: Color.fromRGBO(1, 80, 245, 0.5019607843137255),
            textColor: Color.fromRGBO(1, 80, 245, 0.5019607843137255),
          ),
        )
      ],
    );
  }
}
