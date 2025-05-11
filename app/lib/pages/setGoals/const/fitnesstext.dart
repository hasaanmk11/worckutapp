import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

class FitnessText extends StatelessWidget {
  const FitnessText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20),
      child: Row(
        children: [Text("Fitness", style: commentStyle(40, Colors.white))],
      ),
    );
  }
}
