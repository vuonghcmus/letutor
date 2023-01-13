import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'course_detail_controller.dart';

class CourseDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseDetailController>(() => CourseDetailController());
  }
}