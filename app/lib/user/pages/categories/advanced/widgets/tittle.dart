import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

class advancedScreenTittleCard extends StatelessWidget {
  const advancedScreenTittleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: commenGradient(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Advanced", style: commentStyle(25, Colors.white)),

          Image.asset("assets/logo.png", width: 50, height: 50),
        ],
      ),
    );
  }
}
