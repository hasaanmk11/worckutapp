import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:app/admin/pages/workout_catogories/model/model.dart';

class YoutubeVideoCard extends StatelessWidget {
  const YoutubeVideoCard({super.key, required this.workout});

  final Bignnermodel workout;

  @override
  Widget build(BuildContext context) {
    final videoId = YoutubePlayerController.convertUrlToId(workout.url);

    if (videoId == null) {
      return const SizedBox(
        width: 100,
        height: 100,
        child: Center(child: Icon(Icons.error, color: Colors.red)),
      );
    }

    final controller = YoutubePlayerController.fromVideoId(
      videoId: videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(
        showFullscreenButton: true,
       
        mute: false,
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: 100,
        height: 100,
        child: YoutubePlayerScaffold(
          controller: controller,
          builder: (context, player) => player,
        ),
      ),
    );
  }
}
