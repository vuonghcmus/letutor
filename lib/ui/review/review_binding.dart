import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:letutor/ui/review/review_controller.dart';

class ReviewBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<DashBoardListController>(() => DashBoardListController());
    Get.put(ReviewController());
  }
}

