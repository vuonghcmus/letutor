import 'package:get/get.dart';

import 'dash_board_list_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashBoardListController());
  }
}
