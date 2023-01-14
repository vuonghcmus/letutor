import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../config/app_pages.dart';
import '../controllers/app_controller.dart';

Widget ListTitleComponent(
    {required IconData iconData,
    required String title,
    required String named}) {
  return InkWell(
    onTap: () {
      if (named == AppRoutes.LOGIN) {
        Get.find<AppController>().logout();
      }
      if (named.isNotEmpty) {
        Get.toNamed(named, preventDuplicates: false);
      }
    },
    child: Row(
      children: [
        Icon(
          iconData,
          color: Colors.blue,
          size: 50,
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
