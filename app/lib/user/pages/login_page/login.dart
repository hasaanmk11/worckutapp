import 'package:app/responsive/screen_utils.dart';
import 'package:app/user/pages/login_page/const/consts.dart';
import 'package:app/user/pages/login_page/db/db_function.dart';
import 'package:app/user/pages/login_page/model/login_model.dart';
import 'package:app/user/pages/login_page/widgets/email.dart';
import 'package:app/user/pages/login_page/widgets/pass.dart';
import 'package:app/user/pages/user_dtls_page/userdtls.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          final screen = ScreenUtils(sizingInformation);

          return Stack(
            children: [
              _buildBackgroundImage(),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screen.horizontalPadding,
                  ),
                  child: _buildLoginBox(screen.loginBoxWidth),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return kIsWeb
        ? isWebLoginBg()
        : Positioned.fill(
          child: Image.asset("assets/splash.jpeg", fit: BoxFit.cover),
        );
  }

  Widget _buildLoginBox(double width) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            EmailField(controller: emailController),
            const SizedBox(height: 20),
            PasswordField(controller: passController),
            const SizedBox(height: 20),
            _buildLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return InkWell(
      onTap: () async {
        if (formKey.currentState!.validate()) {
          final data = UserModel(
            username: emailController.text,
            password: passController.text,
            id: userId,
          );

          await addUser(data);

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => DetailsPage()),
          );
        }
      },
      child: Container(
        width: 100,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
        ),
        child: const Center(
          child: Text(
            "Login",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class isWebLoginBg extends StatelessWidget {
  const isWebLoginBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF8E2DE2), // purple
            Color.fromARGB(255, 67, 59, 84), // deep blue
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
