import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

Widget buildArrowIcon() {
  return Padding(
    padding: const EdgeInsets.only(right: 12.0),
    child: Container(
      decoration: BoxDecoration(color: commenColor(), shape: BoxShape.circle),
      child: const Padding(
        padding: EdgeInsets.all(10),
        child: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16),
      ),
    ),
  );
}
