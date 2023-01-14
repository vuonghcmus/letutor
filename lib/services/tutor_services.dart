import 'package:sprintf/sprintf.dart';

import '../constants/api_constants.dart';
import '../models/tutor.dart';
import 'base_services.dart';

class TutorService extends BaseService {
  Future<dynamic> getAllTutorByPage({int page = 1}) async {
    final response = await get(sprintf(API.ALL_TUTOR, [page]));
    return response;
  }

  Future<dynamic> getAllTutorBySearch(
      {int page = 1,
        String search = '',
        String? date,
        List<String> specialties = const [],
        List<double?> time = const [null, null],
        nationality = const {}}) async {
    final body = {
      "filters": {
        "date": date,
        "nationality": nationality,
        "specialties": specialties,
        "tutoringTimeAvailable": time,
      },
      "page": page,
      "perPage": 9,
      "search": search
    };
    final response = await post(API.SEARCH_TUTOR, data: body);
    return response;
  }

  Future<Tutor> getTutorById(String tutorId) async {
    final response = await get(sprintf(API.GET_TUTOR, [tutorId]));
    return Tutor.fromJson(response);
  }

  Future<dynamic> getSchedule(String tutorId) async {
    // final data = {
    //   'tutorId': tutorId,
    //   'startTimestamp': 1670086800000,
    //   'endTimestamp': 1670691599999,
    // };
    final data = {
      'tutorId': tutorId,
      'startTimestamp': DateTime.now()
          .subtract(const Duration(days: 1))
          .millisecondsSinceEpoch
          .toString()
          .substring(0, 13),
      'endTimestamp': DateTime.now()
          .add(const Duration(days: 5))
          .millisecondsSinceEpoch
          .toString()
          .substring(0, 13),
    };
    final response = await get(API.SCHEDULE, params: data);
    return response;
  }

  Future<dynamic> getReviewByTeacherId(String tutorId, {int page = 1}) async {
    final response = await get(sprintf(API.REVIEW_TUTOR, [tutorId, page]));
    return response;
  }
}