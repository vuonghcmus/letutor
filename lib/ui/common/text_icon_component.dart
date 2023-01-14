import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/font/font_text.dart';

class TextIconComponent extends StatelessWidget {
  String title;
  IconData iconData;
  Color? color;

  TextIconComponent({
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
