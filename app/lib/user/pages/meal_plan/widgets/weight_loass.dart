import 'dart:ui';
import 'package:app/styles/cmn.dart';
import 'package:app/user/pages/meal_plan/meal_add.dart';
import 'package:flutter/material.dart';

class WeightlossCrad extends StatelessWidget {
  const WeightlossCrad({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              width: MediaQuery.of(context).size.width - 60,
              height: 120,
              decoration: BoxDecoration(
                gradient: commenGradient(),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
              ),
              child: InkWell(
                onTap:
                    () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Mealadd()),
                    ),
                child: Row(
                  children: [
                    // Left Image
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      child: Image.asset(
                        "assets/meal2.webp",
                        width: 120,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Right Text
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.1),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.4),
                                ),

                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "Weight Loss",
                                style: TextStyle(
                                  color: commenColor(),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Track your calories and stay fit.",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
