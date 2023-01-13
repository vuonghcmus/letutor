// ignore_for_file: override_on_non_overriding_member

import '../base/base_controller.dart';

class DashBoardListController extends BaseController {
  final listType = [
    'All',
    'English for kids',
    'English for Business',
    'Conversational',
    'STARTERS',
    'MOVERS',
    'FLYERS'
  ];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReloadData() {}
}
