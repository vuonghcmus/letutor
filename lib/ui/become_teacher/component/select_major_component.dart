import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../become_teacher_controller.dart';

class SelectMajorComponent extends StatefulWidget {
  final BecomeTeacherController controller;

  const SelectMajorComponent({super.key, required this.controller});
  @override
  State<StatefulWidget> createState() {
    return _SelectMajorComponentState();
  }
}

class _SelectMajorComponentState extends State<SelectMajorComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...widget.controller.specialtiesMap.entries.map((e) {
          return CheckboxListTile(
            title: Text(e.key),
            value: widget.controller.specialtiesMapSelected[e.key],
            onChanged: (bool? value) {
              setState(() {
                widget.controller.specialtiesMapSelected[e.key] = value!;
              });
            },
          );
        }).toList(),
      ],
    );
  }

}