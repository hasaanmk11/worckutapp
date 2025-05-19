
import 'package:app/admin/const/curved_clipper.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/cmn.dart';

Widget buildEmptyCard({
  required BuildContext context,
  required String categories,
  required String text,
  required String example,
  required String image,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: ClipPath(
      clipper: CurvedCornerClipper(),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width - 30,
        decoration: BoxDecoration(
          gradient: commenGradient(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(image, width: 140, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 150),
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
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(text, style: commentStyle(20, Colors.white)),
                  ),
                  const Spacer(),
                  Text(
                    "EX: $example",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
