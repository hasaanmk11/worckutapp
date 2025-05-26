import 'package:app/responsive/home_screen_layouts.dart';
import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';
import 'package:app/responsive/home_screen_layouts.dart';
import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

class FitnessDiscription extends StatelessWidget {
  final ScreenLayouts layouts;

  const FitnessDiscription({super.key, required this.layouts});

  @override
  Widget build(BuildContext context) {
    double cardWidth =
        layouts.isWeb
            ? 320
            : layouts.isTablet
            ? 220
            : 220;

    double cardHeight =
        layouts.isWeb
            ? 140
            : layouts.isTablet
            ? 90
            : 90;

    double fontSize =
        layouts.isWeb
            ? 20
            : layouts.isTablet
            ? 13
            : 12;

    return Container(
      width: cardWidth,
      height: cardHeight,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 92, 157, 233),
        border: Border.all(color: Colors.white),
      ),
      child: Center(
        child: Text(
          "Know what you want - muscle,\nStrength, or fat loss. Clear goals\nkeep you focused and fired up every\nrep!",
          style: commentStyle(fontSize, Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
