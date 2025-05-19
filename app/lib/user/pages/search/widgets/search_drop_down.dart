
import 'package:app/admin/pages/workout_catogories/db/workout_db.dart';

import 'package:flutter/material.dart';

class DropdownButtons extends StatefulWidget {
  const DropdownButtons({super.key});

  @override
  State<DropdownButtons> createState() => _DropdownButtonsState();
}

class _DropdownButtonsState extends State<DropdownButtons> {
  String selectedLevel = "Choose";

  final List<String> levels = [
    "Choose",
    "Beginner",
    "Intermediate",
    "Advanced",
  ];
  final beiggner="Beginner";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        value: selectedLevel,
        isExpanded: true,
        underline: const SizedBox(),
        icon: const Icon(Icons.keyboard_arrow_down),
        items:
            levels.map((level) {
              return DropdownMenuItem(
                value: level,
                child: Text(level, style: const TextStyle(fontSize: 16)),
              );
            }).toList(),
        onChanged: (value) {
          setState(() {
            selectedLevel = value!;
          });

          switch (value) {
            case "Beginner":
              getDataWithId(1);
              break;
            case "Intermediate":
              getDataWithId(2);
              break;
            case "Advanced":
              getDataWithId(3);
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
