import 'dart:io';

import 'package:flutter/foundation.dart'; 
import 'package:flutter/material.dart';
import 'package:app/admin/pages/meal_planner/activitie/Model/activity_model.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.activity});

  final ActivityModel activity;

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (kIsWeb && activity.imageBytes != null) {
      imageWidget = ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.memory(
          activity.imageBytes!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 200,
        ),
      );
    } else if (!kIsWeb &&
        activity.imagePath != null &&
        File(activity.imagePath!).existsSync()) {
      imageWidget = ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.file(
          File(activity.imagePath!),
          fit: BoxFit.cover,
          width: double.infinity,
          height: 200,
        ),
      );
    } else {
      imageWidget = Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text(
            'Image not found',
            style: TextStyle(color: Colors.black54, fontSize: 12),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 200),
        child: imageWidget,
      ),
    );
  }
}
