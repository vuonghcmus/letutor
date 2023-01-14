import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:letutor/ui/history/history_page_controller.dart';

import '../../widgets/app_bar/app_bar_custom.dart';
import 'component/header_history_component.dart';
import 'component/history_item_component.dart';

class HistoryPage extends GetWidget<HistoryPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(isHaveDrawer: controller.isHaveDrawer),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              HeaderHistoryComponent(),
              SizedBox(
                height: 20,
              ),
              ...controller.schedules.map(
                (element) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HistoryItemComponent(
                      schedule: element,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
