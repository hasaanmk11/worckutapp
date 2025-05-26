
import 'package:app/responsive/screen_utils.dart';
import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildWorkoutInfo(String title,  BuildContext ctx) {
  
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              title,
              style: commentStyle(20, Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: commenColor(),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('Track Now', style: commentStyle(12, Colors.black)),
          ),
        ],
      ),
    ),
  );
}
