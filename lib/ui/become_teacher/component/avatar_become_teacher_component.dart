import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:letutor/ui/become_teacher/become_teacher_controller.dart';

import '../../../resources/gen/assets.gen.dart';
import '../../common/circle_box.dart';

class AvatarBecomeTeacherComponent extends StatefulWidget {
  final BecomeTeacherController controller;

  const AvatarBecomeTeacherComponent({super.key, required this.controller});

  @override
  State<StatefulWidget> createState() {
    return AvatarBecomeTeacherComponentState();
  }
}

class AvatarBecomeTeacherComponentState
    extends State<AvatarBecomeTeacherComponent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();
        if (result != null) {
          setState(() {
            widget.controller.fileAvatar = File(result.files.single.path!);
          });
        }
      },
      child: CircleBox(
          size: Get.width / 3,
          child: widget.controller.fileAvatar != null
              ? Image.file(widget.controller.fileAvatar!)
              : Assets.images.notFoundImages.image()),
    );
  }
}
