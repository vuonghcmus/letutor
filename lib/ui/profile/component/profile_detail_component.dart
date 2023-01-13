// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:letutor/config/app_pages.dart';
import 'package:letutor/ui/profile/profile_controller.dart';

import '../../../constants/title_string.dart';
import '../../common/button_custom_component.dart';
import '../../common/text_form_field_custom_component.dart';
import 'field_infor_person.dart';

class ProfileDetailComponent extends StatelessWidget {
  const ProfileDetailComponent({super.key, required this.controller});

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
          const SizedBox(height: 15),
          FieldInforPerson(
            title: TitleString.email,
            isImportant: true,
            child: TextFormFieldCustomComponent(
                onChanged: (value) => {},
                controller:
                    controller.controllers[ProfileController.emailField],
                hintText: ''),
          ),
          const SizedBox(height: 15),
          FieldInforPerson(
            title: TitleString.country,
            isImportant: true,
            child: TextFormFieldCustomComponent(
                onChanged: (value) => {},
                controller:
                    controller.controllers[ProfileController.countryField],
                hintText: ''),
          ),
          const SizedBox(height: 15),
          FieldInforPerson(
            title: TitleString.phoneNumber,
            isImportant: true,
            child: TextFormFieldCustomComponent(
                onChanged: (value) => {},
                controller:
                    controller.controllers[ProfileController.phoneField],
                hintText: ''),
          ),
          const SizedBox(height: 15),
          FieldInforPerson(
            title: TitleString.birthday,
            isImportant: true,
            child: TextFormFieldCustomComponent(
                onChanged: (value) => {},
                controller:
                    controller.controllers[ProfileController.birthayDayField],
                hintText: ''),
          ),
          const SizedBox(height: 15),
          FieldInforPerson(
            title: TitleString.level,
            isImportant: true,
            child: TextFormFieldCustomComponent(
                onChanged: (value) => {},
                controller:
                    controller.controllers[ProfileController.levelField],
                hintText: ''),
          ),
          const SizedBox(height: 15),
          FieldInforPerson(
            title: TitleString.wantToLearn,
            isImportant: true,
            child: TextFormFieldCustomComponent(
                onChanged: (value) => {},
                controller:
                    controller.controllers[ProfileController.wantToLearnField],
                hintText: ''),
          ),
          const SizedBox(height: 15),
          FieldInforPerson(
            title: TitleString.schedule,
            isImportant: true,
            child: TextFormFieldCustomComponent(
                onChanged: (value) => {},
                controller: controller
                    .controllers[ProfileController.studyScheduleField],
                hintText: ''),
          ),
          const SizedBox(height: 15),
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
