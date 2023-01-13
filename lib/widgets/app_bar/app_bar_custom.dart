import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:letutor/config/app_pages.dart';

import '../../resources/gen/assets.gen.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  AppBarCustom({Key? key, required this.isHaveDrawer})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);
  final bool isHaveDrawer;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () {
            Get.toNamed(AppRoutes.LOGIN);
          },
          icon: Assets.svg.lettutorLogo.svg()),
      leadingWidth: 200,
      actions: <Widget>[
        IconButton(
          icon: CircleAvatar(
            radius: 56,
            backgroundColor: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Assets.svg.vietnam.svg(),
            ),
          ),
          onPressed: () => {},
        ),
        isHaveDrawer
            ? IconButton(
                icon: CircleAvatar(
                  radius: 56,
                  backgroundColor: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Assets.svg.iconsMenu.svg(),
                  ),
                ),
                onPressed: () => {Get.toNamed(AppRoutes.DRAWER)},
              )
            : const SizedBox(),
      ],
    );
  }
}
