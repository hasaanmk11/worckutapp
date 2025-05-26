import 'package:app/responsive/home_screen_layouts.dart';
import 'package:app/user/pages/meal_plan/activities/activitycard.dart';
import 'package:app/user/pages/meal_plan/widgets/weighgt_gain_card.dart';
import 'package:app/user/pages/meal_plan/widgets/weight_loass.dart';
import 'package:flutter/material.dart';

class MealMobileLayout extends StatelessWidget {
 final  ScreenLayouts layouts;
   const MealMobileLayout({super.key,required this.layouts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children:  [WeightGainCrad(layouts: layouts,), WeightlossCrad(layouts: layouts,), ActivityCard(layouts: layouts,)],
      ),
    );
  }
}
