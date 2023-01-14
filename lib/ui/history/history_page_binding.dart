import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'history_page_controller.dart';

class HistoryPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HistoryPageController());
  }
}
