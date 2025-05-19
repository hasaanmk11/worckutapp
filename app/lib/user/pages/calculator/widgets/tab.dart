import 'package:flutter/material.dart';

class TabSelector extends StatelessWidget {
  final int selectedTab;
  final Function(int) onTabChanged;

  const TabSelector({
    Key? key,
    required this.selectedTab,
    required this.onTabChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => onTabChanged(0),
          child: Column(
            children: [
              Text(
                "Lose Weight",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: selectedTab == 0 ? Colors.blue : Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                height: 2,
                width: 80,
                color: selectedTab == 0 ? Colors.blue : Colors.transparent,
              ),
            ],
          ),
        ),
        const SizedBox(width: 30),
        GestureDetector(
          onTap: () => onTabChanged(1),
          child: Column(
            children: [
              Text(
                "Gain Weight",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: selectedTab == 1 ? Colors.blue : Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                height: 2,
                width: 80,
                color: selectedTab == 1 ? Colors.blue : Colors.transparent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
