// ignore_for_file: constant_identifier_names, depend_on_referenced_packages

import 'package:get_storage/get_storage.dart';

import '../resources/languages/localization_service.dart';

class AppStorage {
  late GetStorage box;
  static const STORAGE_NAME = "lettutor_storage";
  static const APP_LANGUAGE = "app_language";

  init() async {
    await GetStorage.init(STORAGE_NAME);
    box = GetStorage(STORAGE_NAME);
  }

  Future<void> setLanguage(String language) async {
    box.write(APP_LANGUAGE, language);
  }

  Future<String> getLanguage() async {
    final language = await box.read(APP_LANGUAGE) ?? LocalizationService.VI_VN;
    return language;
  }
}
