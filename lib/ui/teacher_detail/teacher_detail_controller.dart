import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:video_player/video_player.dart';

import '../../models/schedule.dart';
import '../../models/tutor.dart';
import '../../services/tutor_services.dart';
import '../base/base_controller.dart';

class TeacherDetailController extends BaseController {
  final _tutorService = Get.find<TutorService>();

  final listSpecial = [
    'English for Business',
    'Conversational',
    'English for kids',
    'IELTS',
    'TOEIC'
  ];
  Rx<bool> isLoadingVideo = true.obs;
  Rx<bool> isPlayingVideo = false.obs;
  final Rx<bool> isLoadingInit = true.obs;
  late VideoPlayerController videoController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
  final Rx<bool> isFavorite = true.obs;
  late String tutorId;
  final Rx<Tutor> tutor = Tutor().obs;
  final RxList<Schedule> schedules = <Schedule>[].obs;

  @override
  void onInit() {
    super.onInit();
    setUpData();
  }

  void setUpData() async {
    tutorId = Get.arguments['id'];
    try {
      await getDataTutor();
      await getDataSchedule();
      isFavorite.value = tutor.value.isFavorite;
      videoController = VideoPlayerController.network(tutor.value.video);
      videoController.initialize().then((value) {
        isLoadingVideo.value = false;
      });
      isLoadingInit.value = false;
    } catch (e) {
      print(e);
      isLoadingInit.value = false;
    }
  }

  onTapVideo() {
    isPlayingVideo.value = !isPlayingVideo.value;
    if (isPlayingVideo.value) {
      videoController.play();
    } else {
      videoController.pause();
    }
  }

  getDataTutor() async {
    tutor.value = await _tutorService.getTutorById(tutorId);
  }

  getDataSchedule() async {
    final res = await _tutorService.getSchedule(tutorId);
    schedules.value = (res['scheduleOfTutor'] == null)
        ? []
        : (res['scheduleOfTutor'] as List)
            .map((e) => Schedule.fromJson(e))
            .toList();
  }
}
