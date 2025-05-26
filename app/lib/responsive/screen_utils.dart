import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ScreenUtils {
  final SizingInformation sizingInfo;

  late bool isMobile;
  late double horizontalPadding;
  late double loginBoxWidth;

  ScreenUtils(this.sizingInfo) {
    isMobile = sizingInfo.deviceScreenType == DeviceScreenType.mobile;
    horizontalPadding = isMobile ? 32.0 : 100.0;
    loginBoxWidth = isMobile ? double.infinity : 400.0;
  }
}
