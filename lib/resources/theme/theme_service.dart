// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:letutor/resources/theme/app_theme.dart';
//
// class ThemeService {
//   static const LIGHT_THEME = 0;
//   static const DARK_THEME = 1;
//
//   ThemeData? _themeData;
//
//   init(dynamic store) async {
//     loadTheme(store);
//   }
//
//   ThemeData? get themeData {
//     _themeData ??= appThemeData[AppTheme.LIGHT];
//     return _themeData;
//   }
//
//   Future<void> loadTheme(dynamic store) async {
//     final theme = await store.getTheme();
//     currentAppTheme = getAppTheme(theme);
//     _themeData = appThemeData[currentAppTheme];
//   }
//
//   Future<void> updateTheme(dynamic store, int theme) async {
//     currentAppTheme = getAppTheme(theme);
//     _themeData = appThemeData[theme];
//     store.setTheme(theme);
//   }
//
//   AppTheme getAppTheme(int theme) {
//     switch (theme) {
//       case LIGHT_THEME:
//         return AppTheme.LIGHT;
//       case DARK_THEME:
//         return AppTheme.DARK;
//       default:
//         return AppTheme.LIGHT;
//     }
//   }
// }
//
// AppTheme currentAppTheme = AppTheme.LIGHT;
// ColorScheme getColor() => Get.find<ThemeService>().themeData!.colorScheme;