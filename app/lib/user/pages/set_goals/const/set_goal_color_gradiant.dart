import 'dart:ui';

import 'package:flutter/material.dart';

setGoalColorGradian() {
  return LinearGradient(
    colors: [
      Color.fromARGB(255, 77, 160, 255),
      Color.fromARGB(221, 118, 173, 235),
      Color.fromARGB(255, 181, 163, 218),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
