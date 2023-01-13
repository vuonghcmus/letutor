import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../base/base_controller.dart';

class CoursesController extends BaseController{
  Rx<int> index = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }
  onTapInDexTabBarCourses(int i) {
    index.value = i;
    update();
  }
}