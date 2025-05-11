import 'package:app/pages/categories/bignner/db/DbFunction.dart';
import 'package:flutter/material.dart';

class SearchFeild extends StatelessWidget {
  const SearchFeild({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) {
          print(value);

          final filtered =
              setGoalListener.value
                  .where(
                    (goal) => goal.workoutName.toLowerCase().contains(value),
                  )
                  .toList();
            filteredGoalsNotifier.value = filtered;
          
        },
        controller: searchController,
        decoration: const InputDecoration(
          hintText: "Search workouts.....",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
