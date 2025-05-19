import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

BoxDecoration cardDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(18),
    gradient: commenGradient(),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.35),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  );
}
