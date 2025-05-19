import 'package:app/admin/pages/workout_catogories/model/model.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class youtubeVideoCard extends StatelessWidget {
  const youtubeVideoCard({super.key, required this.workout});

  final Bignnermodel workout;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: 100,
        height: 100,
        child: YoutubePlayer(
          controller: YoutubePlayerController(
            initialVideoId: YoutubePlayer.convertUrlToId(workout.url) ?? '',
            flags: YoutubePlayerFlags(autoPlay: false, mute: false),
          ),
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
        ),
      ),
    );
  }
}
