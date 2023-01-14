import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../../constants/title_string.dart';
import '../../../models/schedule.dart';
import '../../../resources/font/font_text.dart';
import '../../common/circle_box.dart';
import '../../common/image_network_component.dart';

class HistoryItemComponent extends StatelessWidget {
  final Schedule schedule;

  const HistoryItemComponent({
    Key? key,
    required this.schedule,
  }) : super(key: key);

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
              height: 180,
              child: Container(
                child: Column(
                  children: [
                    Text(DateFormat('dd/MM/yyyy').format(
                        DateTime.fromMillisecondsSinceEpoch(schedule
                            .scheduleDetailInfo!
                            .scheduleInfo!
                            .startTimestamp))),
                    Row(
                      children: [
                        Text(DateFormat('HH:mm').format(
                            DateTime.fromMillisecondsSinceEpoch(
                                DateTime.now().millisecondsSinceEpoch -
                                    schedule.scheduleDetailInfo!.scheduleInfo!
                                        .endTimestamp))),
                        Text(' ago '),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 180,
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
              padding: EdgeInsets.all(10),
              height: 180,
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
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: Get.width - 40,
                    child: Text(
                      TitleString.noRequirementForLesson,
                      style: text14.copyWith(color: Colors.black),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    child: Column(
                      children: [
                        if (schedule.feedbacks.isEmpty) Text(TitleString.noFeedBack),
                        ...schedule.feedbacks.map(
                          (e) => Column(
                            children: [
                              Text(TitleString.reviews),
                              RatingBar.builder(
                                initialRating: e?.rating.toDouble() ?? 0,
                                minRating: 0,
                                maxRating: 5,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 20,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 5,
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () => {},
                      child: Text(TitleString.enterSchedule),
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
