import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../resources/font/font_text.dart';

TextFormField TextFormFieldCustomComponent(
    {required Function(String) onChanged,
      required TextEditingController? controller,
      required String hintText,
      void Function()? onTap,
      bool readOnly = false,
      bool isObscure = false,
      bool isPhone = false,
      bool isHaveBorder = true,
      int maxLine = 1,
      int? maxLength,
      Widget? icon,
      double radius = 5.0,
      FormFieldValidator<String>? validator}) {
  return TextFormField(
    onTap: onTap,
    readOnly: readOnly,
    maxLines: maxLine,
    inputFormatters: [
      LengthLimitingTextInputFormatter(maxLength),
    ],
    obscureText: isObscure,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: controller,
    textAlign: TextAlign.start,
    validator: validator,
    textCapitalization: TextCapitalization.words,
    keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
    style: text12,
    //focusNode: focusNode,
    onChanged: onChanged,
    decoration: InputDecoration(
      hintStyle: text12.copyWith(color: Colors.grey),
      filled: true,
      fillColor: Colors.white,
      hintText: hintText,
      suffixIcon: icon,
      focusedBorder: isHaveBorder
          ? underLineInputBorder(
          width: 2, color: Colors.grey, radius: radius)
          : null,
      enabledBorder: isHaveBorder
          ? underLineInputBorder(
          width: 2, color: Colors.grey, radius: radius)
          : null,
      // contentPadding: isHaveBorder
      //     ? EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h)
      //     : null,
      isDense: true,
    ),
  );
}

OutlineInputBorder underLineInputBorder(
    {required double width, required color, required radius}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius),
    borderSide: BorderSide(
      color: color,
    ),
  );
}
