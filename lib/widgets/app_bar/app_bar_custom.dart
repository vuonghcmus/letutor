import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:letutor/config/app_pages.dart';

import '../../resources/gen/assets.gen.dart';
import '../../resources/languages/localization_service.dart';
import '../../ui/base/base_controller.dart';
import '../../ui/controllers/app_controller.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final _appController = Get.find<AppController>();
  final BaseController controller;

  AppBarCustom({Key? key, required this.isHaveDrawer, required this.controller})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);
  final bool isHaveDrawer;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () {
            if (_appController.userModel.value?.id == null ||
                _appController.userModel.value?.id == "") {
              Get.offNamed(AppRoutes.LOGIN);
            } else {
              Get.offNamed(AppRoutes.DASH_BOARD_LIST,preventDuplicates: false);
            }
          },
          icon: Assets.svg.lettutorLogo.svg()),
      leadingWidth: 200,
      actions: <Widget>[
        _appController.locale?.value?.languageCode != LocalizationService.VI_VN
            ? IconButton(
                icon: CircleAvatar(
                  radius: 56,
                  backgroundColor: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Assets.svg.english.svg(),
                  ),
                ),
                onPressed: () =>
                    {controller.changeNation(LocalizationService.VI_VN)},
              )
            : IconButton(
                icon: CircleAvatar(
                  radius: 56,
                  backgroundColor: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Assets.svg.vietnam.svg(),
                  ),
                ),
                onPressed: () =>
                    {controller.changeNation(LocalizationService.EN_US)
                      },
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
