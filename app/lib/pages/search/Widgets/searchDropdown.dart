import 'package:flutter/material.dart';

class DropdownButtons extends StatefulWidget {
  const DropdownButtons({super.key});

  @override
  State<DropdownButtons> createState() => _DropdownButtonsState();
}

class _DropdownButtonsState extends State<DropdownButtons> {
  String selectedLevel = "Advanced";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: selectedLevel,

        icon: const Icon(Icons.keyboard_arrow_down),
        items:
            ["Beginner", "Intermediate", "Advanced"]
                .map(
                  (level) => DropdownMenuItem(value: level, child: Text(level)),
                )
                .toList(),
        onChanged: (value) {
          if (value != null) {
            setState(() {
              selectedLevel = value;
            });
          }
        },
      ),
    );
  }
}
