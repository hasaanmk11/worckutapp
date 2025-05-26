import 'package:app/responsive/home_screen_layouts.dart';
import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

class InputFields extends StatelessWidget {
  final TextEditingController heightController;
  final TextEditingController weightController;
  final VoidCallback onChanged;

  const InputFields({
    Key? key,
    required this.heightController,
    required this.weightController,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layout = ScreenLayouts(constraints: constraints);

        return Center(
          child: Container(
            width:
                layout.isWeb
                    ? layout.width * 0.4
                    : layout.isTablet
                    ? layout.width * 0.6
                    : layout.width * 0.9,
            child: Column(
              children: [
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: layout.fontSize,
                  ),
                  controller: heightController,
                  decoration: InputDecoration(
                    hintText: "Enter your height (cm)",
                    labelText: "Height",
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: layout.fontSize,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: layout.fontSize,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: layout.fontSize,
                  ),
                  controller: weightController,
                  decoration: InputDecoration(
                    hintText: "Enter your weight (kg)",
                    labelText: "Weight",
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: layout.fontSize,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: layout.fontSize,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (_) => onChanged(),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}
