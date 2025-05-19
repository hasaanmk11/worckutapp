import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

Widget buildVideoPlayerCard(String videoUrl) {
  final videoId = YoutubePlayer.convertUrlToId(videoUrl);

  if (videoId != null) {
    YoutubePlayerController videoController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        controlsVisibleAtStart: true,
        enableCaption: false,
        isLive: false,
        
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        width: 300,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: YoutubePlayer(controller: videoController),
        ),
      ),
    );
  } else {
    return SizedBox.shrink();
  }
}
