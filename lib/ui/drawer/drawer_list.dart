import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../config/app_pages.dart';
import '../../constants/title_string.dart';
import '../../resources/gen/assets.gen.dart';
import '../../widgets/app_bar/app_bar_custom.dart';
import '../common/circle_box.dart';
import '../common/image_network_component.dart';
import '../common/list_title_component.dart';
import 'drawer_list_controller.dart';

class DrawerList extends GetWidget<DrawerListController> {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(isHaveDrawer: controller.isHaveDrawer),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.PROFILE);
                  },
                  child: Row(
                    children: [
                      CircleBox(
                          size: 50,
                          child: ImageNetworkComponent(
                            url: controller.user.value?.avatar ?? '',
                          )),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        controller.user.value?.name ?? TitleString.noName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTitleComponent(
                  iconData: Icons.book,
                  title: TitleString.buyCourse,
                  named: ''),
              ListTitleComponent(
                  iconData: Icons.key,
                  title: TitleString.changePassword,
                  named: AppRoutes.CHANGE_PASSWORD),
              ListTitleComponent(
                  iconData: Icons.contact_mail_sharp,
                  title: TitleString.teacher,
                  named: AppRoutes.DASH_BOARD_LIST),
              ListTitleComponent(
                  iconData: Icons.calendar_month,
                  title: TitleString.schedule,
                  named: AppRoutes.SCHEDULE),
              ListTitleComponent(
                  iconData: Icons.settings_backup_restore_rounded,
                  title: TitleString.history,
                  named: AppRoutes.HISTORY),
              ListTitleComponent(
                  iconData: Icons.school,
                  title: TitleString.course,
                  named: AppRoutes.COURSES),
              ListTitleComponent(
                  iconData: Icons.book, title: TitleString.myCourse, named: ''),
              ListTitleComponent(
                  iconData: Icons.school_rounded,
                  title: TitleString.registerBecomeTeacher,
                  named: ''),
              ListTitleComponent(
                  iconData: Icons.logout,
                  title: TitleString.logOut,
                  named: AppRoutes.LOGIN),
            ],
          ),
        ),
      ),
    );
  }
}
