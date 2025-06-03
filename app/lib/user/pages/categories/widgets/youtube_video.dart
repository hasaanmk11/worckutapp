import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:app/admin/pages/workout_catogories/model/model.dart';

class YouTubeVideo extends StatelessWidget {
  const YouTubeVideo({super.key, required this.workout});

  final Bignnermodel workout;

  @override
  Widget build(BuildContext context) {
    final videoId = YoutubePlayerController.convertUrlToId(workout.url);

    if (videoId == null) {
      return const SizedBox(
        width: 200,
        height: 120,
        child: Center(child: Icon(Icons.error, color: Colors.red)),
      );
    }

    final controller = YoutubePlayerController.fromVideoId(
      videoId: videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(
        showFullscreenButton: true,

        mute: false,
        enableJavaScript: true,
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: 200,
        height: 120,
        child: YoutubePlayerScaffold(
          controller: controller,
          builder: (context, player) => player,
        ),
      ),
    );
  }
}
