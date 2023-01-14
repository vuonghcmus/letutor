import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:letutor/models/schedule.dart';

import '../../../constants/title_string.dart';
import '../../../resources/font/font_text.dart';
import '../../common/circle_box.dart';
import '../../common/image_network_component.dart';
import '../../dash_board/component/information_teacher_component.dart';

class ScheduleItem extends StatelessWidget {
  final Schedule schedule;

  const ScheduleItem({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              height: 150,
              child: Column(
                children: [
                  Text(DateFormat('dd/MM/yyyy').format(
                      DateTime.fromMillisecondsSinceEpoch(schedule
                          .scheduleDetailInfo!.scheduleInfo!.startTimestamp))),
                ],
              ),
            ),
            Container(
              height: 150,
              child: Column(
                children: [
                  CircleBox(
                    size: 80,
                    child: ImageNetworkComponent(
                      url: schedule.scheduleDetailInfo?.scheduleInfo?.tutorInfo
                              ?.user?.avatar ??
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
              height: 150,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        schedule.scheduleDetailInfo?.scheduleInfo?.startTime ??
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
                    child: Text(
                      schedule.studentRequest.isEmpty
                          ? TitleString.scheduleRequestContent
                          : schedule.studentRequest,
                      style: text14.copyWith(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
