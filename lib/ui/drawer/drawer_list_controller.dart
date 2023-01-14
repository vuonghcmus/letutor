import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../models/user_model.dart';
import '../../services/user_services.dart';
import '../base/base_controller.dart';
import '../controllers/app_controller.dart';

class DrawerListController extends BaseController {
  final _appController = Get.find<AppController>();
  final _userService = Get.find<UserService>();
  // UserModel? get user => _appController.userModel.value;

  Rx<UserModel> user = UserModel(birthday: DateTime(1990)).obs;

  @override
  void onInit() async{
    super.onInit();
    await _userService.getUserInfo();
    user.value = _appController.userModel.value!;
  }
}
