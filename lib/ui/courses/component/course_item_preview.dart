import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../resources/font/font_text.dart';

class CourseItemPreview extends StatelessWidget {
  Widget image;
  String mainTitle;
  String subTitle;
  Widget bottomWidget;
  CourseItemPreview({
    Key? key,
    required this.image,
    required this.mainTitle,
    required this.subTitle,
    required this.bottomWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        image,
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mainTitle,
                style: text16.copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                subTitle,
                style: text14.copyWith(color: Colors.grey),
              ),
              SizedBox(
                height: 15,
              ),
              bottomWidget,
            ],
          ),
        )
      ],
    );
  }
}