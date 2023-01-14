import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../resources/font/font_text.dart';
import '../../common/text_form_field_custom_component.dart';

class FieldInforPerson extends StatelessWidget {
  String title;
  bool isImportant;
  Widget child;
  FieldInforPerson(
      {super.key,
      required this.title,
      required this.child,
      this.isImportant = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: text14,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                width: 1,
              ),
              if (isImportant)
                const Icon(Icons.tag, color: Colors.red, size: 10)
            ],
          ),
          child
        ],
      ),
    );
  }
}
// ignore_for_file: must_be_immutable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import '../../../resources/font/font_text.dart';

class FieldInforPerson extends StatelessWidget {
  String title;
  bool isImportant;
  Widget child;
  FieldInforPerson(
      {super.key,
      required this.title,
      required this.child,
      this.isImportant = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: text14,
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                width: 1,
              ),
              if (isImportant)
                const Icon(Icons.tag, color: Colors.red, size: 10)
            ],
          ),
          child
        ],
      ),
    );
  }
}
