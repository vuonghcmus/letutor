import 'package:flutter/cupertino.dart';

import '../../resources/font/font_text.dart';

class TextContainerComponent extends StatelessWidget {
  String title;
  double? radius;
  Color? color;
  Color? borderColor;
  Color? textColor;

  TextContainerComponent({
    Key? key,
    required this.title,
    this.radius,
    this.color,
    this.borderColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
      decoration: BoxDecoration(
          color: color ?? Color(0xFFF5F6FA),
          border:
          Border.all(color: borderColor ?? color ?? Color(0xFFF5F6FA)),
          borderRadius: BorderRadius.circular(radius ?? 10.0)),
      child: Text(
        title,
        style: text12.copyWith(color: textColor),
      ),
    );
  }
}