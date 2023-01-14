import 'package:letutor/models/user_model.dart';
import 'package:intl/intl.dart';

import '../utils/date_time.dart';

class Review {
  String id;
  String bookingId;
  String firstId;
  String secondId;
  int rating;
  String content;
  DateTime? createdAt;
  DateTime? updatedAt;
  UserModel? firstInfo;

  Review({
    this.id = '',
    this.bookingId = '',
    this.firstId = '',
    this.secondId = '',
    this.rating = 0,
    this.content = '',
    this.createdAt,
    this.updatedAt,
    this.firstInfo,
  });

  factory Review.fromJson(json) {
    return Review(
      id: json['id'] ?? '',
      bookingId: json['bookingId'] ?? '',
      firstId: json['firstId'] ?? '',
      secondId: json['secondId'] ?? '',
      rating: json['rating'] ?? 0,
      content: json['content'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateFormat(time).parse(json['createdAt'])
          : DateTime(1990),
      updatedAt: json['updatedAt'] != null
          ? DateFormat(time).parse(json['updatedAt'])
          : DateTime(1990),
      firstInfo: UserModel.fromJson(json['firstInfo']),
    );
  }
}