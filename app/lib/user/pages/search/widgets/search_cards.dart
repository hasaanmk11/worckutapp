
import 'package:app/admin/pages/workout_catogories/db/workout_db.dart';
import 'package:app/styles/cmn.dart';

import 'package:flutter/material.dart';

class SearchCards extends StatelessWidget {
  const SearchCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: filteredGoalsNotifier,
        builder: (context, value, child) {
          if (value.isEmpty) {
            return const Center(
              child: Text(
                "No goals found.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: value.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final goal = value[index];
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.fitness_center, color: Colors.green),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              "Workout: ${goal.workoutName}",
                              style: commentStyle(20, Colors.black),
                            ),
                            subtitle: Text(
                              "Rep: ${goal.rep}",
                              style: commentStyle(14, Colors.grey),
                            ),
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
