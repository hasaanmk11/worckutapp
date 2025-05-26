import 'dart:ui';

import 'package:app/responsive/home_screen_layouts.dart';
import 'package:app/styles/cmn.dart';

import 'package:app/user/pages/meal_plan/layout/meal_mobile_layout.dart';
import 'package:app/user/pages/meal_plan/layout/meal_web_layout.dart';
import 'package:app/user/pages/meal_plan/widgets/set_meal_text.dart';
import 'package:app/user/pages/meal_plan/widgets/set_meal_tittle_icon.dart';

import 'package:flutter/material.dart';

class MealPlan extends StatelessWidget {
  const MealPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final layout = ScreenLayouts(constraints: constraints);
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          width: layout.isWeb ? 600 : double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: commenColor().withValues(alpha: 0.3),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              mealIcon(),
                              const SizedBox(width: 10),
                              setMealtext(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  layout.isWeb ? MealWebLayout(layouts: layout,) : MealMobileLayout(layouts: layout,),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
