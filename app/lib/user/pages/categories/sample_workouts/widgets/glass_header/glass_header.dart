import 'dart:ui';

import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

Widget glassHeader(String title, Color color) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.white.withOpacity(0.2),
          child: Text(
            title,
            style: commentStyle(
              22,
              color,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  );
}
