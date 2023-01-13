// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../resources/font/font_text.dart';

class TextIcon extends StatelessWidget {
  String title;
  IconData iconData;
  Color? color;

  TextIcon({
    Key? key,
    required this.title,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          iconData,
          size: 30,
          color: color ?? Colors.blue,
        ),
        Text(
          title,
          style: text16.copyWith(color: Colors.blue),
        )
      ],
    );
  }
}
