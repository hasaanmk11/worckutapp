import 'package:flutter/material.dart';

class WeigthGainImage extends StatelessWidget {
  const WeigthGainImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
      child: Image.asset(
        "assets/meal1.jpg",
        width: 120,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
