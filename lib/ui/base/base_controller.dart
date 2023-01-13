import 'dart:ui';

import 'package:get/get.dart';

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
