
import 'package:app/user/pages/categories/advanced/advanced.dart';
import 'package:app/user/pages/categories/beginner/beginner.dart';
import 'package:app/user/pages/categories/intermediate/intermediate.dart';
import 'package:app/user/pages/categories/sample_workouts/sample_wrk.dart';
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
        body: SingleChildScrollView(
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
                InkWell(
                  onTap:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Beginners()),
                      ),
                  child: buildEmptyCard(
                    context: context,
                    categories: "BEGINNER",
                    text: "START WITH BASIC WORCKOUT",
                    example: "PUSH-UP,ABS",
                    image: "assets/beignner.png",
                  ),
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Intermediate()),
                      ),
                  child: buildEmptyCard(
                    context: context,
                    categories: "INTERMEDIATE",
                    text: "START WITH INTERMEDIATE LEVEL",
                    example: "SMALL WEIGHT(5KG),PULL-UPS,FULL BODY",
                    image: "assets/intermediate.png",
                  ),
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Advanced()),
                      ),
                  child: buildEmptyCard(
                    context: context,
                    categories: "ADVANCED",
                    text: "START WITH ADVANCED",
                    example: "CALISTHENIC,BIG WEIGHT",
                    image: "assets/advanced.png",
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
