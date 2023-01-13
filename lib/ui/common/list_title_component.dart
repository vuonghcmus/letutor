// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget ListTitleComponent(
    {required IconData iconData,
    required String title,
    required String named}) {
  return InkWell(
    onTap: () {
      if (named.isNotEmpty) {
        Get.toNamed(named);
      }
    },
    child: Row(
      children: [
        Icon(
          iconData,
          color: Colors.blue,
          size: 50,
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
