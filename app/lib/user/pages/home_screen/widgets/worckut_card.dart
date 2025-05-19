
import 'package:app/admin/const/curved_clipper.dart';
import 'package:app/user/pages/home_screen/widgets/Workout.info.dart';
import 'package:app/user/pages/home_screen/widgets/arrow_icon.dart';
import 'package:app/user/pages/home_screen/widgets/card_decoration.dart';
import 'package:app/user/pages/home_screen/widgets/workout_image.dart';
import 'package:flutter/material.dart';

Widget buildWorkoutCard(BuildContext context, String image, String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: ClipPath(
      clipper: CurvedCornerClipper(),
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width - 20,
        decoration: cardDecoration(),
        child: Row(
          children: [
            buildWorkoutImage(image),
            buildWorkoutInfo(title),
            buildArrowIcon(),
          ],
        ),
      ),
    ),
  );
}
