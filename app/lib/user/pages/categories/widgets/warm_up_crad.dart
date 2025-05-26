import 'package:app/responsive/home_screen_layouts.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/cmn.dart';

class WarmUpCrad extends StatelessWidget {
  const WarmUpCrad({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layout = ScreenLayouts(constraints: constraints);

        return Container(
          height: layout.isMobile ? 200 : 250,
          width: layout.cardWidth * (layout.isWeb ? 2.5 : 2.1),
          decoration: BoxDecoration(
            color: commenColor(),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0.1,
                  child: Image.asset("assets/bg.jpg", fit: BoxFit.cover),
                ),
              ),

              // Side illustration
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: Image.asset(
                  "assets/catgry1.png",
                  width: layout.isMobile ? 120 : 230,

                  fit: BoxFit.cover,
                ),
              ),

              // Text content
              Padding(
                padding: EdgeInsets.only(
                  left: layout.isMobile ? 20 : 30,
                  top: 20,
                  right: layout.isMobile ? 130 : 190,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Warm-Up First!",
                      style: commentStyle(
                        layout.isMobile ? 20 : 30,
                        Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "A good warm-up prevents\ninjury and boosts\nperformance. Take 5 minutes\nto prepare your body.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: layout.fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
