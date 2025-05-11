import 'package:app/pages/loginPage/db/db_function.dart';
import 'package:app/pages/loginPage/login.dart';

import 'package:flutter/material.dart';

void showLogoutDialog( ctx) {
  showDialog(
    context: ctx,
    builder:
        (_) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            "Confirm Logout",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () async {
                await deleteUser();
                Navigator.of(ctx).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const Login()),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text("Logout"),
            ),
          ],
        ),
  );
}
