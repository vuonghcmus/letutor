import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/font/font_text.dart';

class TabBarItem extends StatelessWidget {
  String title;
  bool isSelecting;
  Function()? onTap;
  TabBarItem({
    Key? key,
    required this.title,
    required this.isSelecting,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: SizedBox(
        height: 30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: text15.copyWith(color: isSelecting ? Colors.blue : null),
            ),
            Container(
              height: 2,
              width: 50,
              color: isSelecting ? Colors.blue : null,
            )
          ],
        ),
      ),
    );
  }
}