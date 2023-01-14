import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../base/base_controller.dart';

class PdfController extends BaseController {
  String url = '';
  @override
  void onInit() {
    super.onInit();
    isHaveDrawer = false;
    url = Get.arguments;
    print(Get.arguments);
  }


}