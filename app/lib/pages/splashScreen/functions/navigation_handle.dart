import 'package:app/pages/HomeScreen/home.dart';
import 'package:app/pages/loginPage/db/db_function.dart';
import 'package:app/pages/loginPage/login.dart';
import 'package:flutter/material.dart';

Future<void> handleNavigation(context) async {
  await Future.delayed(const Duration(seconds: 2));
  bool isLoggedIn = await checkUser();

  if (isLoggedIn) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  } else {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }
}
