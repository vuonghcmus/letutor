import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../config/app_pages.dart';
import '../../constants/api_constants.dart';
import '../../constants/constants.dart';
import '../../services/rest_client.dart';
import '../../services/user_services.dart';
import '../../utils/validation.dart';
import '../../widgets/notify/notify_bar.dart';
import '../base/base_controller.dart';

class LoginController extends BaseController {
  final _userService = Get.find<UserService>();
  final RxBool loading = false.obs;

  final Map<String, TextEditingController> controllers = Map.fromEntries(
    [
      emailField,
      passwordField,
    ].map(
      (value) => MapEntry(
        value,
        TextEditingController(),
      ),
    ),
  );

  final Map<String, bool> mapCheckInformation = {
    emailField: false,
    passwordField: false,
  };

  RxBool showPassword = true.obs;

  String? Function(String?) validator(
      {required String? Function(dynamic value) func, required String key}) {
    return (value) {
      String? result = func(value);
      mapCheckInformation[key] = result != null ? false : true;
      return result;
    };
  }

  @override
  void onInit() {
    super.onInit();
    isHaveDrawer = false;
  }

  void login() async {
    validatorEmpty(controllers.values.toList());
    try {
      await _userService.loginAccount(
          email: controllers[emailField]!.text,
          password: controllers[passwordField]!.text);
    } on DioError catch (e) {
      notifyBar(message: e.response?.data['message'], isSuccess: false);

      return;
    }
    Get.offNamed(AppRoutes.DASH_BOARD_LIST);
  }

  handleLogin(LoginType type) async {
    RestClient.instance.clearToken();
    String token = '';
    switch (type) {
      case LoginType.google:
        token = await handleLoginByGoogle();
        break;
      case LoginType.facebook:
        token = await handleLoginByFacebook();
        break;
    }
    if (token.isEmpty) {
      notifyBar(message: 'Login Fail', isSuccess: false);
      return;
    }
    try {
      loading.value = true;
      await _userService.loginByOtherType(accessToken: token, type: type.key);
    } on DioError catch (e) {
      String mes = e.response?.data['message'].toString() ?? '';
      notifyBar(message: mes, isSuccess: false);
      loading.value = false;
      return;
    }
    loading.value = false;
    Get.offNamed(AppRoutes.DASH_BOARD_LIST);
  }

  Future<String> handleLoginByGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    if (googleSignInAccount == null) {
      return '';
    }

    final res = await googleSignInAccount.authentication;
    return res.accessToken ?? '';
  }

  Future<String> handleLoginByFacebook() async {
    try {
      final fb = FacebookLogin();
      final res = await fb.logIn(permissions: [
        FacebookPermission.publicProfile,
      ]);

      switch (res.status) {
        case FacebookLoginStatus.success:

        // Send access token to server for validation and auth
          final FacebookAccessToken? accessToken = res.accessToken;
          return accessToken?.token ?? '';
        case FacebookLoginStatus.cancel:
          print(1);
          break;
        case FacebookLoginStatus.error:
          print(2);
          break;
        default:
          return '';
      }
    } catch (e) {
      print(e);
    }

    return '';
  }
}

enum LoginType { google, facebook }

extension LoginTypeExtension on LoginType {
  String get key {
    switch (this) {
      case LoginType.google:
        return 'google';
      case LoginType.facebook:
        return 'facebook';
    }
  }
}