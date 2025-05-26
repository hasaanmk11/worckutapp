import 'package:app/styles/cmn.dart';
import 'package:app/user/pages/calculator/cal.dart';
import 'package:app/user/pages/categories/categories.dart';
import 'package:app/user/pages/home_screen/home.dart';
import 'package:app/user/pages/search/search.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BootomNavigation extends StatefulWidget {
  const BootomNavigation({super.key});

  @override
  State<BootomNavigation> createState() => _BootomNavigationState();
}

class _BootomNavigationState extends State<BootomNavigation> {
  int _page = 0;

  final Color bgColor = const Color(0xFF2C2C2E);

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchWorkoutPage(),
    const Categories(),
    const Calculator(),
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        final isDesktop =
            sizingInfo.deviceScreenType == DeviceScreenType.desktop;

        return Scaffold(
          body: SafeArea(
            child: Row(
              children: [
                if (isDesktop) _buildWebNavigationRail(),
                Expanded(child: _screens[_page]),
              ],
            ),
          ),
          bottomNavigationBar: isDesktop ? null : _buildMobileBottomNav(),
        );
      },
    );
  }

  Widget _buildMobileBottomNav() {
    return CurvedNavigationBar(
      backgroundColor: commenColor(),
      color: bgColor,
      index: _page,
      height: 60,
      animationDuration: const Duration(milliseconds: 300),
      items: const [
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
    );
  }

  Widget _buildWebNavigationRail() {
    return NavigationRail(
      backgroundColor: bgColor,
      indicatorColor: commenColor(),
      selectedIndex: _page,
      onDestinationSelected: (index) {
        setState(() {
          _page = index;
        });
      },
      labelType: NavigationRailLabelType.all,
      selectedIconTheme: const IconThemeData(color: Colors.white),
      selectedLabelTextStyle: const TextStyle(color: Colors.white),
      unselectedIconTheme: const IconThemeData(color: Colors.white38),
      unselectedLabelTextStyle: const TextStyle(color: Colors.white38),
      destinations: const [
        NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
        NavigationRailDestination(
          icon: Icon(Icons.search),
          label: Text('Search'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.fitness_center),
          label: Text('Workout'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.calculate_outlined),
          label: Text('Calculator'),
        ),
      ],
    );
  }
}
