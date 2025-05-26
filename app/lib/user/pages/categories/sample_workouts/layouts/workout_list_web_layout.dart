import 'package:app/user/pages/categories/sample_workouts/widgets/glass_header/card.dart';
import 'package:app/user/pages/categories/sample_workouts/widgets/glass_header/glass_header.dart';
import 'package:app/user/pages/categories/sample_workouts/widgets/leading_placeholder.dart';
import 'package:flutter/material.dart';

Widget buildWebGridLayout(List<Map<String, dynamic>> workouts, bool isTablet,isLoaded) {
  return GridView.builder(
    itemCount: workouts.length,
    shrinkWrap: true,
    physics: const BouncingScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 1,
    ),
    itemBuilder: (context, index) {
      final workout = workouts[index];
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          glassHeader(workout['title'], workout['color']),
          Expanded(
            child: glassCard(
              child: isLoaded ? workout['widget'] : loadingPlaceholder(),
            ),
          ),
        ],
      );
    },
  );
}
