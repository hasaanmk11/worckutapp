import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

Widget buildEmptyCard({
  required BuildContext context,
  required String categories,
  required String text,
  required String example,
  required String image,
}) {
  return Container(
    height: 220,
    width: MediaQuery.of(context).size.width - 20,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 119, 119, 119).withOpacity(0.2),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Stack(
      children: [
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Image.asset("${image}", width: 140, fit: BoxFit.cover),
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
                  color: const Color.fromARGB(255, 182, 182, 182),
                ),
                child: Center(
                  child: Text(
                    categories,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(text, style: commentStyle(30, Colors.white)),
              ),
              Expanded(
                child: Text(
                  "EX:${example}",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
