import 'package:app/responsive/home_screen_layouts.dart';
import 'package:flutter/material.dart';
import 'package:app/admin/pages/workout_catogories/model/model.dart';
import 'package:app/user/pages/categories/widgets/youtube_video.dart';
import 'package:app/user/pages/categories/widgets/youtube_video_fullscreen_page/full_screen.dart';
import 'package:app/styles/cmn.dart';

Widget categorieCard(List<Bignnermodel> value, int categoryID) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final layout = ScreenLayouts(constraints: constraints);

      if (layout.isWeb) {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: value.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: layout.cardWidth / layout.cardHeight,
            crossAxisSpacing: 16,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            final workout = value[index];
            return _buildWorkoutCard(context, workout, layout);
          },
        );
      } else {
        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: value.length,
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemBuilder: (context, index) {
            final workout = value[index];
            return _buildWorkoutCard(context, workout, layout);
          },
        );
      }
    },
  );
}

Widget _buildWorkoutCard(
  BuildContext context,
  Bignnermodel workout,
  ScreenLayouts layout,
) {
  return Container(
    width: layout.cardWidth,
    height: layout.cardHeight,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: commenGradient(),
    ),
    padding: const EdgeInsets.all(16),
    child: IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Video Preview
          SizedBox(
            width: layout.isWeb ? 200 : 130,
            height: 150,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => VideoFullScreen(videoUrl: workout.url),
                  ),
                );
              },
              child: YouTubeVideo(workout: workout),
            ),
          ),

          const SizedBox(width: 12),

          /// Workout Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    workout.workoutName,
                    style: commentStyle(
                      layout.isWeb
                          ? 30
                          : layout.isTablet
                          ? 20
                          : 13,
                      Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 6),
                Flexible(
                  child: Text(
                    "Duration: ${workout.time}",
                    style: commentStyle(
                      layout.isWeb
                          ? 20
                          : layout.isTablet
                          ? 17
                          : 13,
                      Colors.white70,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    "Sets: ${workout.set}",
                    style: commentStyle(
                      layout.isWeb
                          ? 20
                          : layout.isTablet
                          ? 17
                          : 13,
                      Colors.white70,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    "Rep: ${workout.rep}",
                    style: commentStyle(
                      layout.isWeb
                          ? 20
                          : layout.isTablet
                          ? 17
                          : 13,
                      Colors.white70,
                    ),
                  ),
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
                    builder: (_) => VideoFullScreen(videoUrl: workout.url),
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
  );
}
