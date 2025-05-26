import 'package:app/responsive/home_screen_layouts.dart';
import 'package:app/user/pages/meal_plan/activities/activitycard.dart';
import 'package:app/user/pages/meal_plan/widgets/weighgt_gain_card.dart';
import 'package:app/user/pages/meal_plan/widgets/weight_loass.dart';
import 'package:flutter/material.dart';

class MealWebLayout extends StatelessWidget {
  final ScreenLayouts layouts;
  const MealWebLayout({super.key,required  this.layouts});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,

        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 4,
      ),
      itemBuilder: (context, index) {
        final widgets = [
           WeightGainCrad(layouts: layouts,),
           WeightlossCrad(layouts: layouts,),
           ActivityCard(layouts: layouts,),
        ];
        return widgets[index];
      },
    );
  }
}
