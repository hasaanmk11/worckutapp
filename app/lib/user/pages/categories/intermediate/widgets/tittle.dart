import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

class intermediateScreenTittleCard extends StatelessWidget {
  const intermediateScreenTittleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;

        final isMobile = width < 600;
        final isTablet = width >= 600 && width < 1000;
        final isWeb = width >= 1000;

        return Container(
          height: isWeb ? 150 : 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: commenGradient(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Intermediate",
                style: commentStyle(isWeb ? 30 : 16, Colors.white),
              ),

              Image.asset(
                "assets/logo.png",
                width: isWeb ? 160 : 90,
                height: isWeb ? 100 : 90,
              ),
            ],
          ),
        );
      },
    );
  }
}
