import 'package:get/get.dart';
import 'drawer_list_controller.dart';

class DrawerListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DrawerListController>(() => DrawerListController());
  }
}
