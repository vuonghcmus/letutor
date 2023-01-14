import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../config/app_pages.dart';
import '../../models/course.dart';
import '../../models/topic.dart';
import '../base/base_controller.dart';

class CourseDetailController extends BaseController{
  late Course course;

  final levels = [
    '',
    'Beginner',
    'Upper beginner',
    'Pre-intermediate',
    'Intermediate',
    'Upper intermediate'
  ];


  @override
  void onInit() {
    super.onInit();
    course = Get.arguments[0];
    print(course);
  }

  void handlePdfView(Topic e) {
    Get.toNamed(AppRoutes.PDF_VIEW, arguments: e.nameFile);
  }
}