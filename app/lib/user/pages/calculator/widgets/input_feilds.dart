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
    return Column(
      children: [
        TextField(
          style: TextStyle(color: Colors.white),
          controller: heightController,
          decoration: InputDecoration(
            hintText: "Enter your height (kg)",
            labelText: "Height",
            labelStyle: TextStyle(color: Colors.white),
            hintStyle: TextStyle(color: Colors.white),

            filled: true,
            fillColor: Colors.white.withValues(alpha: 0.1),

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white, width: 1.5),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white, width: 1.5),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white, width: 2.0),
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          style: TextStyle(color: Colors.white),
          controller: weightController,
          decoration: InputDecoration(
            hintText: "Enter your Weight (cm)",
            labelText: "Weight",
            hintStyle: TextStyle(color: Colors.white),
            labelStyle: TextStyle(color: Colors.white),

            filled: true,
            fillColor: Colors.white.withValues(alpha: 0.1),

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white, width: 1.5),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white, width: 1.5),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white, width: 2.0),
            ),
          ),
          keyboardType: TextInputType.number,
          onChanged: (_) => onChanged(),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
