import 'dart:developer';

import 'package:app/pages/loginPage/db/db_function.dart';
import 'package:app/pages/loginPage/model/login_model.dart';
import 'package:app/pages/loginPage/widgets/email.dart';
import 'package:app/pages/loginPage/widgets/pass.dart';
import 'package:app/pages/userDtlsPage/userdtls.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset("assets/splash.jpeg", fit: BoxFit.cover),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  EmailField(controller: _emailController),
                  const SizedBox(height: 20),
                  PasswordField(controller: _passController),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      Navigator.of(
                        context,
                      ).push(MaterialPageRoute(builder: (context) => dtls()));
                      log(_emailController.text);
                      log(_passController.text);
                      final data = UserModel(
                        username: _emailController.text,
                        password: _passController.text,
                        id: "userData",
                      );

                      await addUser(data);
                    },
                    child: Container(
                      width: 90,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
