import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:video_player/video_player.dart';

import '../teacher_detail_controller.dart';

class TeacherVideoComponent extends StatelessWidget {
  final TeacherDetailController controller;

  const TeacherVideoComponent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => Container(
            height: 260,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.blue, width: 2.0)),
            child: Center(
              child: !controller.isLoadingVideo.value
                  ? SizedBox(
                      height: 250,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.onTapVideo();
                            },
                            child: SizedBox(
                              height: 220,
                              child: AspectRatio(
                                  aspectRatio: controller
                                      .videoController.value.aspectRatio,
                                  child:
                                      VideoPlayer(controller.videoController)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              !controller.isPlayingVideo.value
                                  ? InkWell(
                                      onTap: () {
                                        controller.onTapVideo();
                                      },
                                      child: Icon(
                                        Icons.play_arrow,
                                        size: 20,
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        controller.onTapVideo();
                                      },
                                      child: Icon(Icons.pause, size: 20)),
                              SizedBox(
                                width: 5.0,
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: 20,
                                  child: VideoProgressIndicator(
                                      colors: const VideoProgressColors(
                                          playedColor: Colors.blue),
                                      controller.videoController,
                                      allowScrubbing: true),
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                            ],
                          )
                        ],
                      ))
                  : SizedBox(
                      height: 25,
                      width: 25,
                      child: const CircularProgressIndicator(
                        color: Colors.blue,
                      )),
            ),
          )),
    );
  }
}
