import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'dash_board_list_controller.dart';


class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<DashBoardListController>(() => DashBoardListController());
    Get.put(DashBoardListController());
  }
}