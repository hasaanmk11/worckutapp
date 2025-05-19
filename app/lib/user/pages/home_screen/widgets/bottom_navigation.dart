import 'package:app/styles/cmn.dart';
import 'package:app/user/pages/calculator/cal.dart';
import 'package:app/user/pages/categories/categories.dart';
import 'package:app/user/pages/home_screen/home.dart';
import 'package:app/user/pages/search/search.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BootomNavigation extends StatefulWidget {
  const BootomNavigation({super.key});

  @override
  State<BootomNavigation> createState() => _BootomNavigationState();
}

class _BootomNavigationState extends State<BootomNavigation> {
  int _page = 0;

  Color bgColor = const Color(0xFF2C2C2E);

  final List<Widget> _screens = [
    HomeScreen(),
    SearchWorkoutPage(),
    Categories(),
    Calculator(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: commenColor(),
        color: bgColor,
        animationDuration: const Duration(milliseconds: 300),
        index: _page,
        height: 60,
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.fitness_center, size: 30, color: Colors.white),
          Icon(Icons.calculate_outlined, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: SafeArea(child: _screens[_page]),
    );
  }
}
