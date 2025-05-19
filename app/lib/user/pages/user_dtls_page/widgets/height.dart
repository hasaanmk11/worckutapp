import 'package:flutter/material.dart';

Container HeightFld(TextEditingController heightCntr) {
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
            controller: heightCntr,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Height (cm)',
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
