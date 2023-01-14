import 'package:intl/intl.dart';

String time = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSSSZ";
String time1 = "yyyy-MM-dd";

String readTimestamp(int timestamp) {
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return '${DateFormat('dd/MM/yyyy').format(date)}-${weekDay[date.weekday]!}';
}

bool isBeforeNow(int timestamp) {
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return date.isBefore(DateTime.now());
}

final weekDay = {
  1: 'T2',
  2: 'T3',
  3: 'T4',
  4: 'T5',
  5: 'T6',
  6: 'T7',
  7: 'CN',
};
