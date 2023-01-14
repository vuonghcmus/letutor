import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'teacher_detail_controller.dart';

class TeacherDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherDetailController>(() => TeacherDetailController());
  }
}