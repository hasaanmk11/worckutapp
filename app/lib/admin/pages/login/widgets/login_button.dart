import 'package:app/admin/const/const.dart';
import 'package:app/admin/pages/home/admin_home.dart';
import 'package:flutter/material.dart';

class AdminloginButton extends StatelessWidget {
  const AdminloginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final username = usernameController.text.trim();
        final password = passwordController.text.trim();

        if (username == adminUserName && password == adminPassword) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdminHome()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Invalid username or password'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },

      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withValues(alpha: 0.3),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: const Text("Login", style: TextStyle(fontSize: 18)),
    );
  }
}
