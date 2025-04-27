import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildWorkoutCard(BuildContext context, String image, String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 30),
    child: Stack(
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width - 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            title,
            style: GoogleFonts.acme(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
      ],
    ),
  );
}
