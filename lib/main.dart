import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letutor/ui/controllers/app_controller.dart';
import 'package:letutor/ui/main_app.dart';

import 'ui/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();
  await Get.put<AppController>(AppController()).init(Environment.prod);
  runApp(mainApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
