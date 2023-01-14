import 'package:sprintf/sprintf.dart';

import '../constants/api_constants.dart';
import 'base_services.dart';

class CourseService extends BaseService {
  Future<dynamic> getAllCateGory() async {
    final response = await get(API.CONTENT_CATEGORY_COURSE);
    return response;
  }

  Future<dynamic> getAllCourse(
      {int page = 1, int type = 0, String q = ''}) async {
    final response = await get(sprintf(
        type == 0
            ? API.ALL_COURSE
            : type == 1
                ? API.ALL_E_BOOK
                : API.ALL_I_E_BOOk,
        [page, q]));
    return response;
  }
}
