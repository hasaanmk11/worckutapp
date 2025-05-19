import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

class mealIcon extends StatelessWidget {
   mealIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.restaurant_menu, color: commenColor(), size: 28);
  }
}
