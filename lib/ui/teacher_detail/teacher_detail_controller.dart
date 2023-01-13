import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:video_player/video_player.dart';

import '../base/base_controller.dart';

class TeacherDetailController extends BaseController {
  final listSpecial = [
    'English for Business',
    'Conversational',
    'English for kids',
    'IELTS',
    'TOEIC'
  ];

  Rx<bool> isLoadingVideo = true.obs;
  Rx<bool> isPlayingVideo = false.obs;

  late VideoPlayerController videoController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');

  @override
  void onInit() {
    super.onInit();
  }

  onTapVideo() {
    isPlayingVideo.value = !isPlayingVideo.value;
    if (isPlayingVideo.value) {
      videoController.play();
    } else {
      videoController.pause();
    }
  }
}
