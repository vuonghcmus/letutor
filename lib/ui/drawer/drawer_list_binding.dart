import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'drawer_list_controller.dart';

class DrawerListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DrawerListController>(() => DrawerListController());
  }
}