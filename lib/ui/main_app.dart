import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import '../config/app_pages.dart';
import '../constants/title_string.dart';
import '../resources/languages/localization_service.dart';
import 'controllers/app_controller.dart';

class mainApp extends GetWidget<AppController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: GetMaterialApp(
            title: TitleString.appName,
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            getPages: AppPages.pages,
            translations: Get.find<LocalizationService>(),
            locale: controller.locale.value,
            // theme: controller.themeData.value,
            theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
            initialRoute: AppRoutes.LOGIN,
            defaultTransition: Transition.rightToLeft,
            transitionDuration: const Duration(milliseconds: 200),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            fallbackLocale: const Locale('en'),
            supportedLocales: LocalizationService.supportLocale,
          ),
        );
      },
    );
  }
}
