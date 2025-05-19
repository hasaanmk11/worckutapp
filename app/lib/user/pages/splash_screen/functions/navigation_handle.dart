
import 'package:app/user/pages/home_screen/widgets/bottom_navigation.dart';
import 'package:app/user/pages/login_page/db/db_function.dart';
import 'package:app/user/pages/login_page/login.dart';
import 'package:flutter/material.dart';

Future<void> handleNavigation(context) async {
  await Future.delayed(const Duration(seconds: 2));
  bool isLoggedIn = await checkUser();

  if (isLoggedIn) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BootomNavigation()),
    );
  } else {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }
}
