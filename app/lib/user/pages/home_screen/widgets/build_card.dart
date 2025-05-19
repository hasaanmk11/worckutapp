  import 'package:app/user/pages/home_screen/widgets/worckut_card.dart';
import 'package:flutter/material.dart';

Widget buildCard(
    BuildContext context,
    String image,
    String title,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: buildWorkoutCard(context, image, title),
    );
  }
