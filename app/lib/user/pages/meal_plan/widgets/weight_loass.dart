import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app/responsive/home_screen_layouts.dart';
import 'package:app/styles/cmn.dart';
import 'package:app/user/pages/meal_plan/meal_add.dart';

class WeightlossCrad extends StatelessWidget {
  final ScreenLayouts layouts;
  const WeightlossCrad({super.key, required this.layouts});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double cardHeight =
            layouts.isWeb
                ? 180
                : layouts.isTablet
                ? 160
                : 130;

        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: InkWell(
                onTap:
                    () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Mealadd()),
                    ),
                child: Container(
                  height: cardHeight,
                  decoration: BoxDecoration(
                    gradient: commenGradient(),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        child: Image.asset(
                          "assets/meal2.webp",
                          width: cardHeight,
                          height: cardHeight,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Text
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 12,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.1),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.4),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    "Weight Loss",
                                    style: TextStyle(
                                      color: commenColor(),
                                      fontSize:
                                          layouts.isWeb
                                              ? 20
                                              : layouts.isTablet
                                              ? 16
                                              : 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Flexible(
                                child: Text(
                                  "Track your calories and stay fit.",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize:
                                        layouts.isWeb
                                            ? 16
                                            : layouts.isTablet
                                            ? 13
                                            : 10,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  softWrap: true,
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
        );
      },
    );
  }
}
