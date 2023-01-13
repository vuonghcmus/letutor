import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../base/base_controller.dart';

class DashBoardListController extends BaseController{
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