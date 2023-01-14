import 'package:intl/intl.dart';
import 'package:letutor/models/tutor.dart';

import '../utils/date_time.dart';
import 'feed_back.dart';

class Schedule {
  String id;
  String tutorId;
  String startTime;
  String endTime;
  String studentMeetingLink;

  int startTimestamp;
  int endTimestamp;
  bool isBooked;
  bool showRecordUrl;
  DateTime? createdAt;
  String studentRequest;
  String date;
  Tutor? tutorInfo;
  Schedule? scheduleDetailInfo;
  Schedule? scheduleInfo;
  List<Feedback?> feedbacks;
  List<Schedule> scheduleDetails;

  Schedule(
      {this.id = '',
      this.tutorId = '',
      this.startTime = '',
      this.endTime = '',
      this.startTimestamp = 0,
      this.endTimestamp = 0,
      this.isBooked = false,
      this.showRecordUrl = false,
      this.createdAt,
      this.studentRequest = '',
      this.date = '',
      this.tutorInfo,
      this.scheduleDetailInfo,
      this.scheduleInfo,
      this.feedbacks = const [],
      this.scheduleDetails = const [],
      this.studentMeetingLink = ''});

  factory Schedule.fromJson(json) {
    return Schedule(
      id: json['id'] ?? '',
      tutorId: json['tutorId'] ?? '',
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      startTimestamp: json['startTimestamp'] ?? 0,
      endTimestamp: json['endTimestamp'] ?? 0,
      studentMeetingLink: json['studentMeetingLink'] ?? '',
      isBooked: json['isBooked'] ?? false,
      showRecordUrl: json['showRecordUrl'] ?? false,
      createdAt: json['createdAt'] != null
          ? DateFormat(time1).parse(json['createdAt'])
          : DateTime(1990),
      studentRequest: json['studentRequest'] ?? '',
      date: json['date'] ?? '',
      tutorInfo: json['tutorInfo'] != null
          ? Tutor.fromJson(json['tutorInfo'])
          : Tutor(),
      scheduleDetailInfo: json['scheduleDetailInfo'] != null
          ? Schedule.fromJson(json['scheduleDetailInfo'])
          : Schedule(),
      scheduleInfo: json['scheduleInfo'] != null
          ? Schedule.fromJson(json['scheduleInfo'])
          : Schedule(),
      feedbacks: json['feedbacks'] != null
          ? json['feedbacks']
              .map<Feedback>((e) => Feedback.fromJson(e))
              .toList()
          : [],
      scheduleDetails: json['scheduleDetails'] != null
          ? (json['scheduleDetails'] as List)
              .map((e) => Schedule.fromJson(e))
              .toList()
          : [],
    );
  }
}
