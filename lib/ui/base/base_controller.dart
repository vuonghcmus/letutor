import 'dart:ui';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../resources/languages/localization_service.dart';

abstract class BaseController<C> extends GetxController {
  bool isHaveDrawer = true;
  late Rx<Locale?> locale;
  final localeService = Get.find<LocalizationService>();

  @override
  void onInit() {
    super.onInit();
    locale = localeService.getLocale.obs;
  }
}
