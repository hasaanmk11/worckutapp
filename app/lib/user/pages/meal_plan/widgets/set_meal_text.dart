import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

class setMealtext extends StatelessWidget {
  const setMealtext({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Set Meal Plan",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: commenColor(),
        shadows: [
          Shadow(
            color: Colors.greenAccent,
            blurRadius: 10,
            offset: Offset(0, 0),
          ),
        ],
      ),
    );
  }
}
