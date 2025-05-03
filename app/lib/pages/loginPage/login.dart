import 'package:app/pages/loginPage/const/consts.dart';
import 'package:app/pages/loginPage/db/db_function.dart';
import 'package:app/pages/loginPage/model/login_model.dart';
import 'package:app/pages/loginPage/widgets/email.dart';
import 'package:app/pages/loginPage/widgets/pass.dart';
import 'package:app/pages/userDtlsPage/userdtls.dart';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    EmailField(controller: emailController),
                    const SizedBox(height: 20),
                    PasswordField(controller: passController),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          final data = UserModel(
                            username: emailController.text,
                            password: passController.text,
                            id: userId,
                          );

                          await addUser(data);

                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => dtls()),
                          );
                        }
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
          ),
        ],
      ),
    );
  }
}
