import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:letutor/config/app_pages.dart';
import 'package:letutor/ui/profile/profile_controller.dart';

import '../../../constants/title_string.dart';
import '../../common/button_custom_component.dart';
import '../../common/text_form_field_custom_component.dart';
import 'field_infor_person.dart';

class ProfileDetailComponent extends StatelessWidget {
  ProfileDetailComponent({super.key, required this.controller});

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldInforPerson(
            title: TitleString.name,
            isImportant: true,
            child: TextFormFieldCustomComponent(
                onChanged: (value) => {},
                controller: controller.controllers[ProfileController.nameField],
                hintText: ''),
          ),
          SizedBox(height: 15),
          FieldInforPerson(
            title: TitleString.email,
            isImportant: true,
            child: TextFormFieldCustomComponent(
                onChanged: (value) => {},
                controller:
                    controller.controllers[ProfileController.emailField],
                hintText: ''),
          ),
          SizedBox(height: 15),
          FieldInforPerson(
            title: TitleString.country,
            isImportant: true,
            child: TextFormFieldCustomComponent(
                onChanged: (value) => {},
                controller:
                    controller.controllers[ProfileController.countryField],
                hintText: ''),
          ),
          SizedBox(height: 15),
          FieldInforPerson(
            title: TitleString.phoneNumber,
            isImportant: true,
            child: TextFormFieldCustomComponent(
                onChanged: (value) => {},
                controller:
                    controller.controllers[ProfileController.phoneField],
                hintText: ''),
          ),
          SizedBox(height: 15),
          FieldInforPerson(
            title: TitleString.birthday,
            isImportant: true,
            child: TextFormFieldCustomComponent(
                onChanged: (value) => {},
                controller:
                    controller.controllers[ProfileController.birthayDayField],
                hintText: ''),
          ),
          SizedBox(height: 15),
          FieldInforPerson(
            title: TitleString.level,
            isImportant: true,
            child: TextFormFieldCustomComponent(
                onChanged: (value) => {},
                controller:
                    controller.controllers[ProfileController.levelField],
                hintText: ''),
          ),
          SizedBox(height: 15),
          FieldInforPerson(
            title: TitleString.wantToLearn,
            isImportant: true,
            child: TextFormFieldCustomComponent(
                onChanged: (value) => {},
                controller:
                    controller.controllers[ProfileController.wantToLearnField],
                hintText: ''),
          ),
          SizedBox(height: 15),
          FieldInforPerson(
            title: TitleString.schedule,
            isImportant: true,
            child: TextFormFieldCustomComponent(
                onChanged: (value) => {},
                controller: controller
                    .controllers[ProfileController.studyScheduleField],
                hintText: ''),
          ),
          SizedBox(height: 15),
          Center(
            child: ButtonCustomComponent(
              title: TitleString.confirm,
              onPressed: () => {Get.toNamed(AppRoutes.DRAWER)},
            ),
          ),
        ],
      ),
    );
  }
}
