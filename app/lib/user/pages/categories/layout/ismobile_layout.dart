import 'package:flutter/material.dart';

class CategotieMobileLayout extends StatelessWidget {
  const CategotieMobileLayout({super.key, required this.cards});

  final List<Widget> cards;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(cards.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: cards[index],
        );
      }),
    );
  }
}
