import 'package:app/responsive/home_screen_layouts.dart';
import 'package:app/styles/cmn.dart';
import 'package:app/user/pages/calculator/cal.dart';
import 'package:app/user/pages/categories/categories.dart';
import 'package:app/user/pages/home_screen/layouts/mobile_layout.dart';
import 'package:app/user/pages/home_screen/layouts/web_layout.dart';
import 'package:app/user/pages/home_screen/widgets/app_bar_icons.dart';

import 'package:app/user/pages/home_screen/widgets/build_card.dart';
import 'package:app/user/pages/meal_plan/meal.dart';
import 'package:app/user/pages/set_goals/set_goals.dart';

import 'package:app/user/pages/transformation/transformation_page.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layouts = ScreenLayouts(constraints: constraints);

        final cards = [
          buildCard(
            context,
            'assets/splash.jpeg',
            'Start your Workout',
            () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => Categories())),
            layouts.cardHeight,
            layouts.cardWidth,
            layouts.imageSize,
            layouts.fontSize,
          ),
          buildCard(
            context,
            'assets/home2.webp',
            'Meal Plan',
            () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => MealPlan()));
            },
            layouts.cardHeight,
            layouts.cardWidth,
            layouts.imageSize,
            layouts.fontSize,
          ),
          buildCard(
            context,
            'assets/home3.jpg',
            'Set Goals',
            () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => Setgoals()));
            },
            layouts.cardHeight,
            layouts.cardWidth,
            layouts.imageSize,
            layouts.fontSize,
          ),
          buildCard(
            context,
            'assets/home4.jpeg',
            'Calculator',
            () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => Calculator()));
            },
            layouts.cardHeight,
            layouts.cardWidth,
            layouts.imageSize,
            layouts.fontSize,
          ),
          buildCard(
            context,
            'assets/transformation.png',
            'Transformation',
            () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => WeeklyPhotoScreen()),
              );
            },
            layouts.cardHeight,
            layouts.cardWidth,
            layouts.imageSize,
            layouts.fontSize,
          ),
        ];

        return Scaffold(
          backgroundColor: Colors.black,
          appBar:
              layouts.isWeb
                  ? AppBar(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Level Up", style: commentStyle(25, Colors.white)),
                        AppBarIcons(),
                      ],
                    ),
                    backgroundColor: Colors.black,
                  )
                  : null,
          body:
              layouts.isMobile
                  ? MobileLayout(cards: cards)
                  : WebLayout(layouts: layouts, cards: cards),
        );
      },
    );
  }
}
