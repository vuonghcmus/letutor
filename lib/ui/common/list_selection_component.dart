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
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: child,
        )
      ],
    );
  }
}
