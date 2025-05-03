import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  const PasswordField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset("assets/user.png"),
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 10,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
