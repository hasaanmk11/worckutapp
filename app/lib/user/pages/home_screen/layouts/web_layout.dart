import 'package:app/responsive/home_screen_layouts.dart';
import 'package:flutter/widgets.dart';

class WebLayout extends StatelessWidget {
  const WebLayout({super.key, required this.layouts, required this.cards});

  final ScreenLayouts layouts;
  final List<Widget> cards;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.count(
        crossAxisCount: layouts.isTablet ? 2 : 3,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: layouts.cardWidth / layouts.cardHeight,
        children: cards,
      ),
    );
  }
}
