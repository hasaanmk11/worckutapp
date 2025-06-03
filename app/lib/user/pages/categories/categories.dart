import 'package:app/responsive/categorie_screen_layout.dart';
import 'package:app/responsive/home_screen_layouts.dart';
import 'package:app/user/pages/categories/advanced/advanced.dart';
import 'package:app/user/pages/categories/beginner/beginner.dart';
import 'package:app/user/pages/categories/intermediate/intermediate.dart';
import 'package:app/user/pages/categories/layout/ismobile_layout.dart';
import 'package:app/user/pages/categories/layout/isweb_layout.dart';
import 'package:app/user/pages/categories/sample_workouts/workout_video_list.dart';
import 'package:app/user/pages/categories/widgets/catgry_wd.dart';
import 'package:app/user/pages/categories/widgets/discover_text/descover.dart';
import 'package:app/user/pages/categories/widgets/warm_up_crad.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final layout = CategorieScreenLayout(constraints: constraints);

            final List<Widget> cards = [
              InkWell(
                onTap:
                    () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Beginners()),
                    ),
                child: buildEmptyCard(
                  layout: layout,
                  context: context,
                  categories: "BEGINNER",
                  text: "START WITH BASIC WORKOUT",
                  example: "PUSH-UP, ABS",
                  image: "assets/beignner.png",
                ),
              ),
              InkWell(
                onTap:
                    () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Intermediate()),
                    ),
                child: buildEmptyCard(
                  layout: layout,
                  context: context,
                  categories: "INTERMEDIATE",
                  text: "START WITH INTERMEDIATE LEVEL",
                  example: "SMALL WEIGHT (5KG), PULL-UPS, FULL BODY",
                  image: "assets/intermediate.png",
                ),
              ),
              InkWell(
                onTap:
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Advanced())),
                child: buildEmptyCard(
                  layout: layout,
                  context: context,
                  categories: "ADVANCED",
                  text: "START WITH ADVANCED",
                  example: "CALISTHENIC, BIG WEIGHT",
                  image: "assets/advanced.png",
                ),
              ),
              SizedBox(height: 20),
            ];

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    DiscoverText(),
                    const SizedBox(height: 30),
                    InkWell(
                      onTap:
                          () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => WorkoutVideoList(),
                            ),
                          ),
                      child: WarmUpCrad(),
                    ),
                    const SizedBox(height: 30),
                    layout.isMobile
                        ? CategotieMobileLayout(cards: cards)
                        : CategorieWebLayout(layout: layout, cards: cards),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}



