import 'package:letutor/models/user_model.dart';
import 'package:intl/intl.dart';

import '../utils/date_time.dart';

class FavouriteTutor {
  String id;
  String firstId;
  String secondId;
  DateTime? createdAt;
  DateTime? updatedAt;
  UserModel? secondInfo;

  FavouriteTutor(
      {this.id = '',
      this.firstId = '',
      this.secondId = '',
      this.createdAt,
      this.updatedAt,
      this.secondInfo});

  factory FavouriteTutor.fromJson(json) {
    return FavouriteTutor(
      id: json['id'],
      firstId: json['firstId'],
      secondId: json['secondId'],
      createdAt: json['createdAt'] != null
          ? DateFormat(time).parse(json['createdAt'])
          : DateTime(1990),
      updatedAt: json['updatedAt'] != null
          ? DateFormat(time).parse(json['updatedAt'])
          : DateTime(1990),
      secondInfo: UserModel.fromJson(json['secondInfo']),
    );
  }
}
