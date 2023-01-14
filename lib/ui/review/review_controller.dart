import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../models/review.dart';
import '../../services/tutor_services.dart';
import '../base/base_controller.dart';

class ReviewController extends BaseController {
  bool isHaveDrawer = true;

  final _tutorService = Get.find<TutorService>();

  String tutorId = '';
  RxList<Review> reviews = <Review>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    tutorId = Get.arguments['id'];
    getData(page: 1);
    print(reviews);
    isLoading = false.obs;
  }

  void getData({required int page}) async {
    try {
      final res = await _tutorService.getReviewByTeacherId(tutorId, page: page);
      final data = res['data']['rows'];
      reviews.value = (data == null)
          ? []
          : (data as List).map((e) => Review.fromJson(e)).toList();
    } catch (e) {
      print(e);
    }
  }
}
