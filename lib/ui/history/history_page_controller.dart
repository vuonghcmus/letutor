import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../models/schedule.dart';
import '../../services/user_services.dart';
import '../base/base_controller.dart';

class HistoryPageController extends BaseController {
  final _userService = Get.find<UserService>();
  final RxList<Schedule> schedules = <Schedule>[].obs;
  @override
  void onInit() {
    super.onInit();
    getData(page: 1);
  }

  void getData({page = 1}) async {
    try {
      final res = await _userService.getSchedule(page: page);
      schedules.value = (res['data'] == null)
          ? []
          : (res['data']['rows'] as List)
          .map((e) => Schedule.fromJson(e))
          .toList();
      print(schedules.value);
    } catch (e) {
      print(e);
    }
  }
}