import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const BottomNavItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: commenColor(),
            ),
            height: 40,
            width: 40,
            child: Icon(icon, size: 20, color: Colors.black),
          ),
        ),

        Text(label, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
