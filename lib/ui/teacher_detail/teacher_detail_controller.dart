import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:letutor/models/user_model.dart';
import 'package:video_player/video_player.dart';

import '../../constants/title_string.dart';
import '../../models/schedule.dart';
import '../../models/tutor.dart';
import '../../services/tutor_services.dart';
import '../../widgets/notify/notify_bar.dart';
import '../base/base_controller.dart';
import '../controllers/app_controller.dart';

class TeacherDetailController extends BaseController {
  final _tutorService = Get.find<TutorService>();
  final _appController = Get.find<AppController>();

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

  final TextEditingController reasonController = new TextEditingController();

  final Map<String, bool> reportTitleMap = {
    TitleString.thisTutorAnnoysMe: false,
    TitleString.thisProfileIsFake: false,
    TitleString.profilePhotoDoNotMatch: false,
  };

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

  void book(String id) async {
    try {
      UserModel? userModel = _appController.userModel!.value;
      if (userModel?.walletInfo?.amount == "0") {
        notifyBar(message: 'You not enough money!', isSuccess: false);
        return;
      }
      final res = await _tutorService.bookSchedule(scheduleDetailIds: id);
      notifyBar(message: 'Register success!', isSuccess: true);
      getDataSchedule();
    } on DioError catch (e) {
      notifyBar(message: 'Register false!', isSuccess: false);
    }
  }

  void reportTeacher(String teacherId) async {
    if (reasonController.text.isEmpty) {
      notifyBar(message: 'Please enter reason!', isSuccess: false);
      return;
    }
    final res = await _tutorService.reportTutor(reasonController.text, tutorId);
    notifyBar(message: res['message'], isSuccess: true);
  }
}
