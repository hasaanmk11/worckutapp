import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

class FitnessDiscription extends StatelessWidget {
  const FitnessDiscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 92, 157, 233),
        border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
      ),
      child: Center(
        child: Text(
          "Know what you want - muscle,\nStrength, or fat loss. Clear goals\nkeep you focused and fired up every\nrep!",
          style: commentStyle(12, Colors.white),
        ),
      ),
    );
  }
}
