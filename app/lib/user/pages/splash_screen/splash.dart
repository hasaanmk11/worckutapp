import 'package:app/responsive/home_screen_layouts.dart';
import 'package:app/user/pages/splash_screen/functions/navigation_handle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    handleNavigation(context);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layout = ScreenLayouts(constraints: constraints);

        
        final splashImage = "assets/splash.jpeg";

        return Scaffold(
          body: Stack(
            children: [
              
              SizedBox.expand(
                child: Image.asset(splashImage, fit: BoxFit.cover),
              ),

              
              Center(
                child: Text(
                  "Level up",
                  style: GoogleFonts.acme(
                    fontSize:
                        layout.isMobile
                            ? 40
                            : layout.isTablet
                            ? 50
                            : 60,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: const [
                      Shadow(
                        blurRadius: 8.0,
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
