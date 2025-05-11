// lib/pages/transformation/widgets/take_photo_button.dart

import 'package:flutter/material.dart';

class TakePhotoButton extends StatelessWidget {
  final VoidCallback onPressed;

  const TakePhotoButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Take Weekly Photo',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
