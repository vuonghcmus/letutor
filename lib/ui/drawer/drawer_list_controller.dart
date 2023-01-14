import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../models/user_model.dart';
import '../../resources/languages/localization_service.dart';
import '../../services/user_services.dart';
import '../base/base_controller.dart';
import '../controllers/app_controller.dart';

class DrawerListController extends BaseController {
  final _localizationService = Get.find<LocalizationService>();
  final _appController = Get.find<AppController>();
  final _userService = Get.find<UserService>();
  // UserModel? get user => _appController.userModel.value;

  Rx<UserModel> user = UserModel(birthday: DateTime(1990)).obs;

  @override
  void onInit() {
    super.onInit();
    _userService.getUserInfo().then((value) => user.value = value);
    locale = _localizationService.getLocale.obs;
  }

}
