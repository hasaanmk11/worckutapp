import 'package:app/user/pages/categories/sample_workouts/widgets/glass_header/card.dart';
import 'package:app/user/pages/categories/sample_workouts/widgets/glass_header/glass_header.dart';
import 'package:app/user/pages/categories/sample_workouts/widgets/leading_placeholder.dart';
import 'package:flutter/material.dart';

Widget buildMobileLayout(List<Map<String, dynamic>> workouts,isLoaded) {
  return ListView.separated(
    itemCount: workouts.length,
    separatorBuilder: (_, __) => const SizedBox(height: 30),
    itemBuilder: (context, index) {
      final workout = workouts[index];
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          glassHeader(workout['title'], workout['color']),
          glassCard(
            child: isLoaded ? workout['widget'] : loadingPlaceholder(),
          ),
        ],
      );
    },
  );
}
