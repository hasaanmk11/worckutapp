import 'package:app/user/pages/calculator/cal.dart';
import 'package:app/user/pages/categories/categories.dart';
import 'package:app/user/pages/home_screen/widgets/app_bar.dart';
import 'package:app/user/pages/home_screen/widgets/build_card.dart';
import 'package:app/user/pages/meal_plan/meal.dart';
import 'package:app/user/pages/set_goals/set_goals.dart';
import 'package:app/user/pages/transformation/transformation_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverToBoxAdapter(child: _buildMenuCards(context)),
        ],
      ),
    );
  }

  Widget _buildMenuCards(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        buildCard(
          context,
          "assets/home1.jpg",
          "Start your Workout",
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => Categories()),
          ),
        ),
        buildCard(
          context,
          "assets/home2.webp",
          "Meal Plan",
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const MealPlan()),
          ),
        ),
        buildCard(
          context,
          "assets/home3.jpg",
          "Set Goals",
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => Setgoals()),
          ),
        ),
        buildCard(
          context,
          "assets/home4.jpeg",
          "Calculator",
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const Calculator()),
          ),
        ),
        buildCard(
          context,
          "assets/transformation.png",
          "Transformation",
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const WeeklyPhotoScreen()),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
