import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

Row ActivityText() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          "Your Activities",
          style: commentStyle(30, Colors.deepPurple),
        ),
      ),
    ],
  );
}
