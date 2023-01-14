import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/user_model.dart';
import '../../../resources/gen/assets.gen.dart';
import '../../common/circle_box.dart';
import '../../common/image_network_component.dart';
import '../../controllers/app_controller.dart';
import '../profile_controller.dart';

class LogoProfileComponent extends StatelessWidget {
  final user = Get.find<AppController>().userModel.value ??
      UserModel(birthday: DateTime.now());
  ProfileController controler = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleBox(
          size: 130,
          child: ImageNetworkComponent(
            url: user.avatar,
          ),
        ),
        Positioned(
          left: 90,
          top: 90,
          child: InkWell(
            onTap: () async {
              final ImagePicker _picker = ImagePicker();
              final XFile? image =
                  await _picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                controler.uploadImage(image.path);
              }
            },
            child: CircleBox(
              size: 50,
              child: Icon(
                Icons.edit,
                size: 30,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
