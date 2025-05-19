import 'dart:ui';
import 'package:app/styles/cmn.dart';
import 'package:app/user/pages/meal_plan/widgets/gain_and_loss_page/weigth_gain.dart';
import 'package:app/user/pages/meal_plan/widgets/gain_and_loss_page/weigth_gain_image.dart';
import 'package:flutter/material.dart';

class WeightGainCrad extends StatelessWidget {
  const WeightGainCrad({super.key});

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
              child: Row(
                children: [
                  // Image Section
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const WeightGainAdd(),
                        ),
                      );
                    },
                    child: WeigthGainImage(),
                  ),
                  // Text Section
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
                              color: Colors.black.withValues(alpha: 0.2),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.2),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Weight Gain",
                              style: TextStyle(
                                color: commenColor(),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Boost your calories with tailored meals.",
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
    );
  }
}

