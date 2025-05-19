
import 'package:app/user/pages/user_dtls_page/widgets/logout_alert.dart';
import 'package:flutter/material.dart';

class FlotingActionButtonPage extends StatelessWidget {
  const FlotingActionButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => showLogoutDialog(context),
      backgroundColor: Colors.white.withOpacity(0.9),
      label: const Text("Logout", style: TextStyle(color: Colors.red)),
      icon: const Icon(Icons.logout, color: Colors.red),
    );
  }
}
