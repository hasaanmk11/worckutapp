import 'package:app/user/pages/home_screen/widgets/app_bar.dart';
import 'package:flutter/widgets.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key, required this.cards});

  final List<Widget> cards;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        buildSliverAppBar(),
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: cards[index],
              ),
              childCount: cards.length,
            ),
          ),
        ),
      ],
    );
  }
}
