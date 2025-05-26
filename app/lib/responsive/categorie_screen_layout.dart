import 'package:flutter/material.dart';

class CategorieScreenLayout {
  late bool isMobile;
  late bool isTablet;
  late bool isWeb;
  late double width;
  late double cardHeight;
  late double cardWidth;
  late double imageSize;
  late double fontSize;

  CategorieScreenLayout({required BoxConstraints constraints}) {
    width = constraints.maxWidth;

    isMobile = width < 600;
    isTablet = width >= 600 && width < 1000;
    isWeb = width >= 1000;

    cardHeight = isMobile ? 180 : 220;
    cardWidth = isMobile ? 340 : width / (isTablet ? 2.2 : 3.2);
    imageSize = isMobile ? 80 : 150;
    fontSize = isMobile ? 14 : 16;
  }
}
