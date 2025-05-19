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
        height: 160,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: commenGradient(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => VideoFullScreen(videoUrl: workout.url),
                      ),
                    );
                  },

                  child: YouTubeVideo(workout: workout),
                ),
              ),
              Column(children: [WorkoutImage(workout: workout)]),

              const SizedBox(width: 16),

              Flexible(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      workout.workoutName,
                      style: commentStyle(20, Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          "Duration:",
                          style: commentStyle(16, Colors.white70),
                        ),
                        SizedBox(width: 3),
                        Text(
                          workout.time,
                          style: commentStyle(16, Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Sets:", style: commentStyle(16, Colors.white70)),
                        SizedBox(width: 3),
                        Text(
                          workout.set,
                          style: commentStyle(16, Colors.white),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Text("Rep:", style: commentStyle(16, Colors.white70)),
                        SizedBox(width: 3),
                        Text(
                          workout.rep,
                          style: commentStyle(16, Colors.white),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),

              const SizedBox(width: 16),

              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => VideoFullScreen(videoUrl: workout.url),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: commenColor(),
                    child: const Icon(Icons.play_arrow, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
