
import 'package:flutter/material.dart';

Widget buildWorkoutImage(
  String image,

  BuildContext ctx,
) {
  return Container(
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        image,
        width:100,
        height: 100,
        fit: BoxFit.cover,
      ),
    ),
  );
}
