import 'package:app/styles/cmn.dart';
import 'package:app/user/pages/home_screen/widgets/app_bar_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildSliverAppBar() {
  return SliverAppBar(
    pinned: true,
    expandedHeight: 170,
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,

    flexibleSpace: ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      child: Container(
        color: Colors.white.withValues(alpha: 0.1),
        child: FlexibleSpaceBar(
          background: Padding(
            padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBarIcons(),
                const SizedBox(height: 10),
                Text(
                  "Level Up",
                  style: GoogleFonts.acme(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  "Nice To Meet You",
                  style: GoogleFonts.acme(
                    color: Colors.white.withValues(alpha: 0.3),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
