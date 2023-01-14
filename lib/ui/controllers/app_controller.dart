
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letutor/services/tutor_services.dart';

import '../../config/app_storage.dart';
import '../../constants/api_constants.dart';
import '../../models/user_model.dart';
import '../../resources/languages/localization_service.dart';
import '../../resources/theme/app_theme.dart';
import '../../resources/theme/theme_service.dart';
import '../../services/become_teacher_services.dart';
import '../../services/course_service.dart';
import '../../services/rest_client.dart';
import '../../services/user_services.dart';

class AppController extends GetxController {

  Environment? env;
  late Rx<Locale?> locale;
  late Rx<ThemeData?> themeData;
  final Rx<UserModel?> userModel = UserModel(birthday: DateTime(1990)).obs;
  final Rx<AuthState> authState = AuthState.unauthorized.obs;

  init(Environment environment) async {
    env = environment;
    await Future.wait([initStorage()]);
    final appStorage = Get.find<AppStorage>();

    setupApp();
    await initLanguage();
    await initApi(null);
  }

  Future<void> initStorage() async {
    await Get.put(AppStorage()).init();
  }

  Future<void> initLanguage() async {
    await Get.put(LocalizationService()).init();
    final localeService = Get.find<LocalizationService>();
    locale = localeService.getLocale.obs;

    // Listen to the change of locale
    localeService.appStorage.box.listenKey(AppStorage.APP_LANGUAGE, (value) {
      if (value != null) {

        final newLocale = Locale(value);
        locale.value = newLocale;
      }
    });
  }

  initApi(String? accessToken) async {
    String baseUrl;
    // init api
    switch (env!) {
      case Environment.prod:
        baseUrl = API.BASE_URL_PRO;
        break;
      case Environment.dev:
        baseUrl = API.BASE_URL_DEV;
        break;
    }
    RestClient.instance.init(baseUrl, accessToken: accessToken ?? "");
  }

  void setupApp() {
    Get.put(UserService());
    Get.put(TutorService());
    Get.put(CourseService());
    Get.put(BecomeTeacherServices());
  }

  logout() async {
    userModel.value = UserModel(birthday: DateTime(1990));
    authState.value = AuthState.unauthorized;
    RestClient.instance.clearToken();
    await Get.find<AppStorage>().logout();
  }


}

enum AuthState { unauthorized, authorized }

enum Environment { dev, prod }