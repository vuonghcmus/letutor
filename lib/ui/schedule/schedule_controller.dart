import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:letutor/widgets/notify/notify_bar.dart';

import '../../constants/title_string.dart';
import '../../models/schedule.dart';
import '../../services/user_services.dart';
import '../base/base_controller.dart';

class ScheduleController extends BaseController{
  final _userService = Get.find<UserService>();
  final RxList<Schedule> schedules = <Schedule>[].obs;

  RxInt pageSelected = 0.obs;
  RxInt totalPage = 7.obs;

  final TextEditingController textController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData({page = 1}) async {
    try {
      final res = await _userService.getSchedule(page: page);
      int t = res['data']['count'] ?? 10;
      totalPage.value = (t / 10).ceil();
      schedules.value = (res['data'] == null)
          ? []
          : (res['data']['rows'] as List)
          .map((e) => Schedule.fromJson(e))
          .toList();
    } catch (e) {
      print(e);
    }
  }

  void handleCancel(Schedule schedule, int i) async {
    try {
      final res = await _userService.cancelSchedule(
          scheduleDetailId: schedule.scheduleDetailInfo!.id, i: i);
      notifyBar(message: res['message'] ?? 'Đã cố lỗi xảy ra');
    } catch (e) {
      notifyBar(message: 'Không thể xóa lịch học này', isSuccess: false);
    }
  }

}