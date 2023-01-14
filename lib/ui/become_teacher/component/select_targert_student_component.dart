import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letutor/ui/become_teacher/become_teacher_controller.dart';

class SelectTargetStudentComponent extends StatefulWidget {
  final BecomeTeacherController controller;

  const SelectTargetStudentComponent({super.key, required this.controller});

  @override
  State<SelectTargetStudentComponent> createState() {
    return _SelectTargetStudentComponentState();
  }
}

class _SelectTargetStudentComponentState extends State<SelectTargetStudentComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...widget.controller.targetStudentMap.entries.map((e) {
          return CheckboxListTile(
            title: Text(e.key),
            value: widget.controller.targetStudentMapSelected[e.key],
            onChanged: (bool? value) {
              setState(() {
                widget.controller.targetStudentMapSelected
                    .updateAll((key, value) => value = false);
                widget.controller.targetStudentMapSelected[e.key] = value!;
              });
              print(widget.controller.targetStudentMapSelected);
            },
          );
        }).toList(),
      ],
    );
  }
}
