import 'dart:ui';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../resources/languages/localization_service.dart';
import '../controllers/app_controller.dart';

abstract class BaseController<C> extends GetxController {
  final _localizationService = Get.find<LocalizationService>();
  final _appController = Get.find<AppController>();
  bool isHaveDrawer = true;
  late Rx<Locale?> locale;
  final localeService = Get.find<LocalizationService>();

  @override
  void onInit() {
    super.onInit();
    locale = localeService.getLocale.obs;
  }

  Future<void> changeNation(String languageCode) async {
    await _localizationService.updateLanguage(languageCode);
    locale.value = _localizationService.getLocale;
    _appController.locale.value = _localizationService.getLocale;
  }
}
