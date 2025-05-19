import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle commentStyle(double size, Color cr) {
  return GoogleFonts.acme(
    fontSize: size,
    color: cr,
    fontWeight: FontWeight.bold,
    
  );
}

Color commenColor() {
  return const Color.fromARGB(255, 212, 255, 0);
}

LinearGradient commenGradient() {
  return LinearGradient(
    colors: [Color.fromARGB(255, 68, 74, 40), Color.fromARGB(255, 37, 37, 40)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

