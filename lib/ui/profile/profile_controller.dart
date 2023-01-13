import 'package:flutter/cupertino.dart';

import '../base/base_controller.dart';

class ProfileController extends BaseController{
  static const String nameField = 'nameField';
  static const String emailField = 'emailField';
  static const String countryField = 'countryField';
  static const String phoneField = 'phoneField';
  static const String birthayDayField = 'birthayDayField';
  static const String studyScheduleField = 'studyScheduleField';
  static const String wantToLearnField = 'wantToLearnField';
  static const String levelField = 'levelField';
  final Map<String, TextEditingController> controllers = Map.fromEntries(
    [
      nameField,
      emailField,
      countryField,
      phoneField,
      birthayDayField,
      levelField,
      // wantToLearnField,
      studyScheduleField,
    ].map(
          (value) => MapEntry(
        value,
        TextEditingController(),
      ),
    ),
  );
  @override
  void onInit() {
    super.onInit();
    setUpDataProfile();
  }

  @override
  void onReloadData() {}

  void setUpDataProfile() {
    controllers[nameField]?.text = 'Quan dz';
    controllers[emailField]?.text = 'quandz@lettutor.com';
    controllers[countryField]?.text = 'Viet Nam';
    controllers[phoneField]?.text = '0343681753';
    controllers[birthayDayField]?.text = '2001-04-24';
    controllers[levelField]?.text = 'English (Begin)';
    //controllers[studyScheduleField]?.text = '';
  }
}