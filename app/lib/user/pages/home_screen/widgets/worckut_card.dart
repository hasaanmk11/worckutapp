import 'package:app/admin/const/curved_clipper.dart';

import 'package:app/responsive/screen_utils.dart';
import 'package:app/user/pages/home_screen/widgets/Workout.info.dart';
import 'package:app/user/pages/home_screen/widgets/arrow_icon.dart';
import 'package:app/user/pages/home_screen/widgets/card_decoration.dart';
import 'package:app/user/pages/home_screen/widgets/workout_image.dart';
import 'package:flutter/material.dart';

Widget buildWorkoutCard(
  BuildContext context,
  String image,
  String title,
 
) {
  return ClipPath(
    clipper: CurvedCornerClipper(),
    child: Container(
      height:100,
      width: 200,
      decoration: cardDecoration(),
      child: Row(
        children: [
          buildWorkoutImage(image, context),
          buildWorkoutInfo(title, context),
          buildArrowIcon(),
        ],
      ),
    ),
  );
}
