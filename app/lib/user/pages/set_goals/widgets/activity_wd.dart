import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

Row activityText() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [Text("Your Activities", style: commentStyle(20, Colors.white))],
  );
}
