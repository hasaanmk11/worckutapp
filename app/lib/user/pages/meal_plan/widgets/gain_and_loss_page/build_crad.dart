import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

Widget buildInfoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        Text(
          "$label: ",
          style: commentStyle(
            15,
            Colors.white70,
          ).copyWith(fontWeight: FontWeight.w500),
        ),
        Expanded(
          child: Text(
            value,
            style: commentStyle(
              15,
              Colors.white,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}
