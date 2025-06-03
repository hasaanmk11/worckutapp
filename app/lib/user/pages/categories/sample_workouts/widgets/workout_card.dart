import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

Widget buildVideoPlayerCard(String videoUrl) {
  final videoId = YoutubePlayerController.convertUrlToId(videoUrl);

  if (videoId == null) return SizedBox.shrink();

  final controller = YoutubePlayerController.fromVideoId(
    videoId: videoId,
    autoPlay: false,
    params: const YoutubePlayerParams(showFullscreenButton: true, mute: false),
  );

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: YoutubePlayerScaffold(
          controller: controller,
          builder: (context, player) => player,
        ),
      ),
    ),
  );
}
