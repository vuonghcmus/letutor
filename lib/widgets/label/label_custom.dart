import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/font/font_text.dart';

class LabelCustom extends StatelessWidget {
  String content;
  LabelCustom({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(5.0)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Text(
          content,
          style: text14,
        ),
        SizedBox(
          width: 10,
        ),
        const Icon(
          Icons.close,
          size: 15,
        )
      ]),
    );
  }
}