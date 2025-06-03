import 'dart:io';
import 'dart:ui';

import 'package:app/admin/pages/login/admin_login.dart';
import 'package:app/user/pages/login_page/const/consts.dart';
import 'package:app/user/pages/login_page/db/db_function.dart';
import 'package:app/user/pages/set_goals/set_goal_timer/db/db.dart';
import 'package:app/user/pages/user_dtls_page/db/db.dart';
import 'package:app/user/pages/user_dtls_page/widgets/floting_button.dart';
import 'package:app/user/pages/user_dtls_page/widgets/info-tittle.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();

    getDataFromHeigthAndWeigth();
    checkUser();
    setGoalCardGetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FlotingActionButtonPage(),
      body: Stack(
        children: [
          // Background Gradient
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF1FA2FF),
                  Color(0xFF12D8FA),
                  Color(0xFFA6FFCB),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: FadeTransition(
                opacity: _fade,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ValueListenableBuilder(
                        valueListenable: userDtlsListener,
                        builder: (context, value, child) {
                          if (value.isEmpty) {
                            return const Center(
                              child: Text(
                                "No user data found.",
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          }

                          final data = value[0].username ?? "Unknown";

                          return ValueListenableBuilder(
                            valueListenable: heigthAndWeigthListener,
                            builder: (context, heigthAndWeigth, child) {
                              if (heigthAndWeigth.isEmpty) {
                                return const Center(
                                  child: Text(
                                    "No height and weight data found.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                );
                              }

                              final h = heigthAndWeigth[0].heigth.toString();
                              final w = heigthAndWeigth[0].weigth.toString();
                              final image = heigthAndWeigth[0].imagePath ?? "";

                              return ValueListenableBuilder(
                                valueListenable: setGoalCardListener,
                                builder: (context, goalDya, child) {
                                  String goalDyas = "N/A";
                                  if (goalDya.isNotEmpty) {
                                    goalDyas = goalDya.last.day.toString();
                                  }

                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // ✅ Fixed Image Display
                                      CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.white,
                                        child: ClipOval(
                                          child:
                                              image.isEmpty
                                                  ? const Icon(
                                                    Icons.person,
                                                    size: 50,
                                                    color: Colors.grey,
                                                  )
                                                  : kIsWeb
                                                  ? Image.network(
                                                    image,
                                                    width: 100,
                                                    height: 100,
                                                    fit: BoxFit.cover,
                                                    errorBuilder:
                                                        (
                                                          context,
                                                          error,
                                                          stackTrace,
                                                        ) => const Icon(
                                                          Icons.person,
                                                          size: 50,
                                                          color: Colors.grey,
                                                        ),
                                                  )
                                                  : Image.file(
                                                    File(image),
                                                    width: 100,
                                                    height: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),

                                      const Text(
                                        "User Profile",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      infoTile("Username", data),
                                      infoTile("Goal Level", goalDyas),
                                      infoTile("Height", h),
                                      infoTile("Weight", w),
                                    ],
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Admin Button
          Padding(
            padding: const EdgeInsets.only(top: 40, right: 10),
            child: Align(
              alignment: Alignment.topRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => AdminLoing()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.admin_panel_settings),
                label: const Text("Admin"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
