import 'package:app/responsive/home_screen_layouts.dart';
import 'package:flutter/material.dart';

class TipItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const TipItem(this.icon, this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layout = ScreenLayouts(constraints: constraints);

        final double containerMaxWidth = layout.isWeb ? 500 : double.infinity;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: containerMaxWidth),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.orange,
                    child: Icon(icon, color: Colors.white, size: 20),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ),
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: layout.fontSize,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
