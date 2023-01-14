import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:letutor/models/schedule.dart';
import 'package:letutor/ui/schedule/schedule_controller.dart';

import '../../../constants/constants.dart';
import '../../../constants/title_string.dart';
import '../../../resources/font/font_text.dart';
import '../../common/circle_box.dart';
import '../../common/image_network_component.dart';
import '../../dash_board/component/information_teacher_component.dart';
import '../../meeting/video_meeting.dart';

class ScheduleItem extends StatelessWidget {
  final Schedule schedule;
  final ScheduleController controller;

  const ScheduleItem(
      {super.key, required this.schedule, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Table(
          border: TableBorder.all(),
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(2),
          },
          children: <TableRow>[
            TableRow(children: <Widget>[
              Container(
                height: 250,
                child: Column(
                  children: [
                    Text(DateFormat('dd/MM/yyyy').format(
                        DateTime.fromMillisecondsSinceEpoch(schedule
                            .scheduleDetailInfo!
                            .scheduleInfo!
                            .startTimestamp))),
                  ],
                ),
              ),
              Container(
                height: 250,
                child: Column(
                  children: [
                    CircleBox(
                      size: 80,
                      child: ImageNetworkComponent(
                        url: schedule.scheduleDetailInfo?.scheduleInfo
                                ?.tutorInfo?.user?.avatar ??
                            '',
                      ),
                    ),
                    Text(
                        schedule.scheduleDetailInfo?.scheduleInfo?.tutorInfo!
                                .user!.name ??
                            TitleString.noName,
                        style: text14.copyWith(color: Colors.black)),
                  ],
                ),
              ),
              Container(
                height: 250,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          schedule.scheduleDetailInfo?.scheduleInfo
                                  ?.startTime ??
                              "",
                          style: text14.copyWith(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          " - ",
                          style: text14.copyWith(color: Colors.black),
                        ),
                        Text(
                          schedule.scheduleDetailInfo?.scheduleInfo?.endTime ??
                              "",
                          style: text14.copyWith(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Text(
                            schedule.studentRequest.isEmpty
                                ? TitleString.scheduleRequestContent
                                : schedule.studentRequest,
                            style: text14.copyWith(color: Colors.black),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VideoMeeting(
                                          studentMeetingLink:
                                              schedule.studentMeetingLink)),
                                );
                              },
                              child: Text(TitleString.enterClass)),
                          ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return DialogCancelClass(
                                        controller: controller,
                                        schedule: schedule,
                                      );
                                    });
                              },
                              child: Text(TitleString.cancel))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class DialogCancelClass extends StatefulWidget {
  final ScheduleController controller;
  final Schedule schedule;

  const DialogCancelClass(
      {super.key, required this.controller, required this.schedule});

  @override
  State<StatefulWidget> createState() {
    return DialogCancelClassState();
  }
}

class DialogCancelClassState extends State<DialogCancelClass> {
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
            TitleString.reasonCancelClass,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButtonFormField(
              isExpanded: true,
              hint: Text(TitleString.whatIsYourReasonForCancelingThisClass),
              items: [
                ...reasonCancelClassTitleMap.entries
                    .map((e) => DropdownMenuItem(
                          value: e.key,
                          child: Text(e.value,
                              overflow: TextOverflow.ellipsis, style: text14),
                        ))
              ],
              onChanged: (Object? value) {
                widget.controller.textController.text = value.toString();
              },
              value: widget.controller.textController?.text != ''
                  ? widget.controller.textController?.text
                  : null,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              maxLines: 5,
              controller: widget.controller.reasonController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 40.0),
                hintText: TitleString.extraNotes,
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
                    widget.controller.handleCancel(
                        widget.schedule,
                        int.tryParse(widget.controller.textController.text) ??
                            1);
                    Navigator.pop(context);
                  },
                  child: Text(TitleString.confirm),
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
