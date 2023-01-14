import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonCustomComponent extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const ButtonCustomComponent({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)))),
            onPressed: onPressed,
            child: Text(title, style: const TextStyle(color: Colors.white)))
      ],
    );
  }
}
