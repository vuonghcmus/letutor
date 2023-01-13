// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';

class SubCourseDetailComponent extends StatelessWidget {
  String title;
  List<Widget> children;

  SubCourseDetailComponent(
      {Key? key, required this.title, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ...children
      ],
    );
  }
}
