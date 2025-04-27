import 'package:app/pages/categories/advanced/advanced.dart';
import 'package:app/pages/categories/bignner/beginners.dart';
import 'package:app/pages/categories/intermediate/intermediate.dart';
import 'package:app/pages/categories/widgets/catgryWd.dart';
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
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Discover",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                      255,
                      119,
                      119,
                      119,
                    ).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Image.asset(
                          "assets/catgry1.png",
                          width: 140,
                          fit: BoxFit.cover,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 20,
                          right: 150,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Warm-Up First!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "A good warm-up prevents\ninjury and boosts\nperformance. Take 5 minutes\nto prepare your body.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                    image: "assets/catgry2.png",
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
                    image: "assets/catgry3.png",
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
                    image: "assets/catgry4.png",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
