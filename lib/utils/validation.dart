import 'package:flutter/cupertino.dart';



bool checkRegisterAvailable(mapCheckInformation) => mapCheckInformation.values
    .fold(true, (previousValue, element) => previousValue && element);

void validatorEmpty(List<TextEditingController> controllers) {
  for (var item in controllers) {
    if (item.text.isNotEmpty) {
      continue;
    }
    item.text = '';
    item.text = '';
  }
}