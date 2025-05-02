import 'dart:io';
import 'dart:ui';

import 'package:app/pages/mealPlan/activities/activityModel/activity_model.dart';
import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.activity});

  final ActivityModel activity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        activity.image.isNotEmpty
            ? ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.file(File(activity.image), fit: BoxFit.contain),
            )
            : const Text(
              'Image not found',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
        SizedBox(height: 6),
      ],
    );
  }
}
