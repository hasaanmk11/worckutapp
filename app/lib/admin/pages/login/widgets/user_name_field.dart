import 'package:app/admin/const/const.dart';
import 'package:flutter/material.dart';

class userNameField extends StatelessWidget {
  const userNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: usernameController,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "Username",
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
