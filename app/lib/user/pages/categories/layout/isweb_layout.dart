import 'package:app/responsive/categorie_screen_layout.dart';
import 'package:flutter/material.dart';

class CategorieWebLayout extends StatelessWidget {
  const CategorieWebLayout({
    super.key,
    required this.layout,
    required this.cards,
  });

  final CategorieScreenLayout layout;
  final List<Widget> cards;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: layout.isTablet ? 2 : 3,
      shrinkWrap: true,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: layout.cardWidth / layout.cardHeight,
      children: cards,
    );
  }
}
