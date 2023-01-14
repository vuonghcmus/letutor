import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:letutor/widgets/app_bar/app_bar_custom.dart';
import 'package:intl/intl.dart';

import '../../constants/title_string.dart';
import 'component/booking_course_component.dart';
import 'component/teacher_detail_component.dart';
import 'component/teacher_information_component.dart';
import 'component/teacher_video_component.dart';
import 'teacher_detail_controller.dart';

class TeacherDetail extends GetWidget<TeacherDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        isHaveDrawer: controller.isHaveDrawer,
        controller: controller,
      ),
      body: Center(
        child: Obx(
          () => SingleChildScrollView(
            child: controller.isLoadingInit.value
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TeacherInformationComponent(
                        controller: controller,
                      ),
                      TeacherVideoComponent(controller: controller),
                      SizedBox(
                        height: 20,
                      ),
                      TeacherDetailComponent(controller: controller),
                      SizedBox(
                        height: 20,
                      ),
                      ...controller.schedules.map(
                        (element) => BookingCourseComponent(
                          schedule: element,
                          isBooked: element.isBooked,
                          date: DateFormat('dd/MM/yyyy').format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  element.startTimestamp)),
                          time: element.startTime + '-' + element.endTime,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class DialogReportTeacher extends StatefulWidget {
  final TeacherDetailController controller;
  final String teacherId;

  const DialogReportTeacher(
      {super.key, required this.controller, required this.teacherId});

  @override
  State<StatefulWidget> createState() {
    return DialogReportTeacherState();
  }
}

class DialogReportTeacherState extends State<DialogReportTeacher> {
  dialogContent(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            TitleString.report,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ...widget.controller.reportTitleMap.entries.map(
            (e) => CheckboxListTile(
                title: Text(e.key),
                value: widget.controller.reportTitleMap[e.key],
                onChanged: (bool? value) {
                  setState(() {
                    widget.controller.reportTitleMap[e.key] = value!;
                    for (MapEntry<String, bool> item
                        in widget.controller.reportTitleMap.entries) {
                      if (widget.controller.reportTitleMap[item.key] == true) {
                        if (!widget.controller.reasonController.text
                            .contains(e.key + "\n")) {
                          widget.controller.reasonController.text +=
                              e.key + "\n";
                        }
                      } else {
                        widget.controller.reasonController.text = widget
                            .controller.reasonController.text
                            .replaceAll(item.key + "\n", '');
                      }
                    }
                  });
                }),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              maxLines: 5,
              controller: widget.controller.reasonController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 40.0),
                hintText: TitleString.report,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(TitleString.cancel),
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.controller.reportTeacher(widget.teacherId);
                    Navigator.pop(context);
                  },
                  child: Text(TitleString.report),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}
