import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const BottomNavItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.deepPurpleAccent,
          ),
          width: 50,
          height: 45,
          child: Icon(icon, size: 30, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.black)),
      ],
    );
  }
}
