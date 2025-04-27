import 'package:flutter/material.dart';

Container WeightFil() {
  return Container(
    height: 40,
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.9),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Weight(km)',
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 10,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
