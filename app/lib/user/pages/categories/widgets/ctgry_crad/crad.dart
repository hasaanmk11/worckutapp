import 'dart:io';

import 'package:app/admin/pages/workout_catogories/model/model.dart';
import 'package:app/user/pages/categories/widgets/workout_image.dart';
import 'package:app/user/pages/categories/widgets/youtube_video.dart';
import 'package:app/user/pages/categories/widgets/youtube_video_fullscreen_page/full_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/cmn.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

ListView categorieCard(List<Bignnermodel> value, int categoryID) {
  return ListView.separated(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: value.length,
    separatorBuilder: (context, index) => const SizedBox(height: 20),
    itemBuilder: (context, index) {
      final workout = value[index];

      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: commenGradient(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Video Preview
                SizedBox(
                  width: 120,
                  height: 90,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  VideoFullScreen(videoUrl: workout.url),
                        ),
                      );
                    },
                    child: YouTubeVideo(workout: workout),
                  ),
                ),

                const SizedBox(width: 12),

                /// Image
                // SizedBox(
                //   width: 60,
                //   height: 90,
                //   child: WorkoutImage(workout: workout),
                // ),
                const SizedBox(width: 12),

                /// Workout Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        workout.workoutName,
                        style: commentStyle(18, Colors.white),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Duration: ${workout.time}",
                        style: commentStyle(14, Colors.white70),
                      ),
                      Text(
                        "Sets: ${workout.set}",
                        style: commentStyle(14, Colors.white70),
                      ),
                      Text(
                        "Rep: ${workout.rep}",
                        style: commentStyle(14, Colors.white70),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 12),

                /// Play Button
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  VideoFullScreen(videoUrl: workout.url),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: commenColor(),
                      child: const Icon(Icons.play_arrow, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
