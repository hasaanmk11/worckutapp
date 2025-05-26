import 'package:app/responsive/categorie_screen_layout.dart';
import 'package:app/responsive/home_screen_layouts.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/cmn.dart';
import 'package:app/admin/const/curved_clipper.dart';

Widget buildEmptyCard({
  required BuildContext context,
  required CategorieScreenLayout layout,
  required String categories,
  required String text,
  required String example,
  required String image,
}) {
  return ClipPath(
    clipper: CurvedCornerClipper(),
    child: Container(
      height: layout.cardHeight,
      width: layout.cardWidth,
      decoration: BoxDecoration(
        gradient: commenGradient(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // Text Section
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 130,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: commenColor(),
                    ),
                    child: Center(
                      child: Text(
                        categories,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: layout.fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    text,
                    style: commentStyle(layout.fontSize + 4, Colors.white),
                  ),
                  const Spacer(),
                  Text(
                    "EX: $example",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: layout.fontSize - 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Image Section
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              image,
              width: layout.imageSize,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    ),
  );
}
