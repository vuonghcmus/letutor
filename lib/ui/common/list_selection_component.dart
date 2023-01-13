// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';

import '../../resources/font/font_text.dart';

class ListSelectionComponent extends StatelessWidget {
  String title;
  Widget child;

  ListSelectionComponent({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: text18.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: child,
        )
      ],
    );
  }
}
