import 'package:app/pages/HomeScreen/home.dart';
import 'package:app/pages/HomeScreen/widgets/wd.dart';
import 'package:app/pages/calculator/cal.dart';
import 'package:app/pages/categories/categories.dart';
import 'package:app/pages/search/search.dart';
import 'package:flutter/material.dart';

class BootomNavigation extends StatelessWidget {
  const BootomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap:
                () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => HomeScreen())),
            child: BottomNavItem(icon: Icons.home, label: "HOME"),
          ),
          InkWell(
            onTap:
                () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SearchWorkoutPage()),
                ),
            child: BottomNavItem(icon: Icons.search, label: "SEARCH"),
          ),
          InkWell(
            onTap:
                () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => Categories())),
            child: BottomNavItem(icon: Icons.fitness_center, label: "GYN"),
          ),
          InkWell(
            onTap:
                () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => Calculator())),
            child: BottomNavItem(icon: Icons.calculate_outlined, label: "CAL"),
          ),
        ],
      ),
    );
  }
}
