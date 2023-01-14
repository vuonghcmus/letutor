import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:letutor/ui/pdf_view/pdf_controller.dart';

class PdfBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PdfController());
  }
}
