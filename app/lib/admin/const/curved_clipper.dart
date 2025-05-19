import 'dart:ui';

import 'package:flutter/material.dart';

class CurvedCornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double radius = 40.0; 

    Path path = Path();
    path.lineTo(size.width - radius, 0);

    
    path.arcToPoint(
      Offset(size.width, radius),
      radius: Radius.circular(radius),
      clockwise: false,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
