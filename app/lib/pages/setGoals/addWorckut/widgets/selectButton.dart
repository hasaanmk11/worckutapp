import 'package:app/pages/categories/db_listeners/db.dart';
import 'package:app/pages/setGoals/startWorckut/start.dart';
import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({super.key, required this.selectedIndexes});

  final List<int> selectedIndexes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: selectedIndexes.isNotEmpty,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      final selectedWorkouts =
                          selectedIndexes
                              .map((i) => beginners.value[i].name)
                              .toList();
                      return Start(workout: selectedWorkouts);
                    },
                  ),
                );
              },
              child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Select",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
