import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:letutor/config/app_pages.dart';
import 'package:letutor/ui/profile/component/want_to_learn_list_component.dart';
import 'package:letutor/ui/profile/profile_controller.dart';
import 'package:intl/intl.dart';

import '../../../constants/constants.dart';
import '../../../constants/title_string.dart';
import '../../../resources/font/font_text.dart';
import '../../../utils/date_time.dart';
import '../../common/button_custom_component.dart';
import '../../common/text_form_field_custom_component.dart';
import 'field_infor_person.dart';

class ProfileDetailComponent extends StatelessWidget {
  ProfileDetailComponent({super.key, required this.controller});

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FieldInforPerson(
                title: TitleString.name,
                isImportant: true,
                child: TextFormFieldCustomComponent(
                    onChanged: (value) => {},
                    controller: controller.controllers[nameField],
                    hintText: ''),
              ),
              SizedBox(height: 15),
              FieldInforPerson(
                title: TitleString.email,
                isImportant: true,
                child: TextFormFieldCustomComponent(
                    readOnly: true,
                    onChanged: (value) => {},
                    controller: controller.controllers[emailField],
                    hintText: ''),
              ),
              SizedBox(height: 15),
              FieldInforPerson(
                title: TitleString.country,
                isImportant: true,
                child: Container(
                  color: Colors.white,
                  child: DropdownButtonFormField(
                    isExpanded: true,
                    items: [
                      ...languagesCountry.entries.map((e) => DropdownMenuItem(
                            value: e.key,
                            child: Text(e.value,
                                overflow: TextOverflow.ellipsis, style: text14),
                          ))
                    ],
                    onChanged: (Object? value) {
                      controller.controllers[countryField]!.text =
                          value.toString();
                      controller.update();
                    },
                    value: controller.controllers[countryField]?.text != ""
                        ? controller.controllers[countryField]?.text
                        : languagesCountry.entries.first.key,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              FieldInforPerson(
                title: TitleString.phoneNumber,
                isImportant: true,
                child: TextFormFieldCustomComponent(
                    readOnly: true,
                    onChanged: (value) => {},
                    controller: controller.controllers[phoneField],
                    hintText: ''),
              ),
              SizedBox(height: 15),
              FieldInforPerson(
                title: TitleString.birthday,
                isImportant: true,
                child: TextFormFieldCustomComponent(
                    readOnly: true,
                    onTap: () {
                      showDatePicker(
                              initialDatePickerMode: DatePickerMode.day,
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1990),
                              lastDate: DateTime(2050))
                          .then((value) => {
                                controller.controllers[birthdayField]?.text =
                                    DateFormat(time1).format(value!)
                              });
                    },
                    controller: controller.controllers[birthdayField],
                    hintText: '',
                    onChanged: (value) {}),
              ),
              SizedBox(height: 15),
              FieldInforPerson(
                title: TitleString.level,
                isImportant: true,
                child: Container(
                  color: Colors.white,
                  child: DropdownButtonFormField(
                    value: controller.controllers[levelField]?.text != ""
                        ? controller.controllers[levelField]?.text
                        : levelUser.entries.first.key,
                    isExpanded: true,
                    items: [
                      ...levelUser.entries.map(
                        (e) => DropdownMenuItem(
                          value: e.key,
                          child: Text(e.value,
                              overflow: TextOverflow.ellipsis, style: text14),
                        ),
                      )
                    ],
                    onChanged: (Object? value) {
                      controller.controllers[levelField]!.text = value.toString();
                      controller.update();
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              FieldInforPerson(
                title: TitleString.wantToLearn,
                isImportant: true,
                child: WantToLearnListComponent(),
              ),
              SizedBox(height: 15),
              FieldInforPerson(
                title: TitleString.schedule,
                isImportant: true,
                child: TextFormFieldCustomComponent(
                    onChanged: (value) => {},
                    controller: controller.controllers[studyScheduleField],
                    hintText: ''),
              ),
              SizedBox(height: 15),
              Center(
                child: ButtonCustomComponent(
                  title: TitleString.confirm,
                  onPressed: () => {
                    controller.updateProfile(),
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
