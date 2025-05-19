import 'package:flutter/material.dart';

ClipRRect TopImage() {
  return ClipRRect(
    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(220)),
    child: SizedBox(
      width: double.infinity,
      height: 300,
      child: Image.asset("assets/addSetGoal.png", fit: BoxFit.cover),
    ),
  );
}
