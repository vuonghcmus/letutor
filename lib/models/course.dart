import 'package:letutor/models/topic.dart';

import 'category.dart';

class Course {
  int coursePrice;
  int defaultPrice;
  String id;
  String name;
  String description;
  String imageUrl;
  String reason;
  String purpose;
  String other_details;
  String level;
  bool visible;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Topic> topics;
  List<Category> categories;

  Course({
    this.coursePrice = 0,
    this.defaultPrice = 0,
    this.id = '',
    this.name = '',
    this.description = '',
    this.imageUrl = '',
    this.reason = '',
    this.purpose = '',
    this.other_details = '',
    this.level = '',
    this.visible = false,
    this.createdAt,
    this.updatedAt,
    this.topics = const [],
    this.categories = const [],
  });

  factory Course.fromJson(json) {
    return Course(
      id: json['id'] ?? '',
      description: json['description'] ?? '',
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      reason: json['reason'] ?? '',
      purpose: json['purpose'] ?? '',
      other_details: json['other_details'] ?? '',
      level: json['level'] ?? '',
      visible: json['visible'] ?? false,
      coursePrice: json['course_price'] ?? 0,
      defaultPrice: json['default_price'] ?? 0,
      topics: json['topics'] == null
          ? []
          : (json['topics'] as List).map((e) => Topic.fromJson(e)).toList(),
      categories: json['categories'] == null
          ? []
          : (json['categories'] as List)
          .map((e) => Category.fromJson(e))
          .toList(),
    );
  }
}
