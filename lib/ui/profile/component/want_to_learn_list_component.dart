import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../widgets/label/label_custom.dart';
import '../../controllers/app_controller.dart';

class WantToLearnListComponent extends StatelessWidget {
  final topics =
      Get.find<AppController>().userModel.value?.getListWantToLearn() ?? [];

  WantToLearnListComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: Colors.grey,
          )),
      child: Wrap(spacing: 5.0, runSpacing: 5.0, children: [
        ...topics.map(
          (e) => LabelCustom(
            content: e.name,
          ),
        )
      ]),
    );
  }
}
