import 'dart:ui';
import 'package:app/admin/const/const.dart';
import 'package:app/admin/pages/home/admin_home.dart';
import 'package:app/admin/pages/login/widgets/login_button.dart';
import 'package:app/admin/pages/login/widgets/login_text.dart';
import 'package:app/admin/pages/login/widgets/password_field.dart';
import 'package:app/admin/pages/login/widgets/user_name_field.dart';
import 'package:flutter/material.dart';

class AdminLoing extends StatefulWidget {
  const AdminLoing({super.key});

  @override
  State<AdminLoing> createState() => _AdminLoingState();
}

class _AdminLoingState extends State<AdminLoing>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    fade = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1FA2FF), Color(0xFF12D8FA), Color(0xFFA6FFCB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: fade,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      adminLoginText(),
                      const SizedBox(height: 30),
                      userNameField(),
                      const SizedBox(height: 20),
                      passWordField(),
                      const SizedBox(height: 30),
                      AdminloginButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



