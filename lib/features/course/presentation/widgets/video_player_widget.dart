import 'package:course_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controllerVideo;
  final GlobalKey aspectRatioKey;
  final double heightVideo;
  final Function() onTapVideo;

  const VideoPlayerWidget({
    super.key,
    required this.controllerVideo,
    required this.aspectRatioKey,
    required this.heightVideo,
    required this.onTapVideo,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapVideo,
      child: Stack(
        children: [
          AspectRatio(
            key: aspectRatioKey,
            aspectRatio: controllerVideo.value.aspectRatio,
            child: VideoPlayer(controllerVideo),
          ),
          Container(
            width: 100.w,
            height: heightVideo,
            alignment: Alignment.center,
            child: Visibility(
              visible: controllerVideo.value.isPlaying != true,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(
                  controllerVideo.value.isPlaying == true
                      ? Icons.pause
                      : Icons.play_arrow,
                  size: 26,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              height: 1.h,
              width: 100.w,
              child: VideoProgressIndicator(
                controllerVideo,
                allowScrubbing: true,
                colors: const VideoProgressColors(
                  playedColor: AppPallet.blue,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
