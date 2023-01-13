import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letutor/ui/controllers/app_controller.dart';
import 'package:letutor/ui/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.put<AppController>(AppController()).init();
  runApp(mainApp());
}
