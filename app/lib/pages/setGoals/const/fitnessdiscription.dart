import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

class FitnessDiscription extends StatelessWidget {
  const FitnessDiscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Know what you want - muscle,\nStrength, or fat loss. Clear goals\nkeep you focused and fired up every\nrep!",
      style: commentStyle(12, Colors.white),
    );
  }
}
