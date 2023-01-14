import 'package:get_storage/get_storage.dart';

import '../resources/languages/localization_service.dart';
import '../resources/theme/theme_service.dart';

class AppStorage {
  late GetStorage box;
  static const STORAGE_NAME = "lettutor_storage";
  static const APP_LANGUAGE = "app_language";
  static const APP_USER_INFO = "app_user_info";
  static const USER_TOKEN = "user_token";
  // static const APP_THEME = "app_theme";

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

  Future<void> saveToken(String refreshToken) async {
    box.write(USER_TOKEN, refreshToken);
  }

  Future<String?> getToken() async {
    final token = await box.read(USER_TOKEN);
    return token;
  }

  Future<void> logout() async {
    if (box.hasData(APP_LANGUAGE)) await box.remove(APP_LANGUAGE);
    if (box.hasData(USER_TOKEN)) await box.remove(USER_TOKEN);
    if (box.hasData(APP_USER_INFO)) await box.remove(APP_USER_INFO);
  }

  // Future<void> setTheme(int theme) async {
  //   box.write(APP_THEME, theme);
  // }

  // Future<int> getTheme() async {
  //   final theme = await box.read(APP_THEME) ?? ThemeService.LIGHT_THEME;
  //   return theme;
  // }
}
