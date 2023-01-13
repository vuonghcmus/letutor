import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letutor/ui/controllers/app_controller.dart';
import 'package:letutor/ui/main_app.dart';

import 'ui/login/login.dart';

void main() async {
  // runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();

  await Get.put<AppController>(AppController()).init();
  runApp(mainApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: LoginPage());
//   }
// }


