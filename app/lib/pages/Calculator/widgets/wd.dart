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
          controller: heightController,
          decoration: InputDecoration(
            hintText: "Enter your height (cm)",
            labelText: "Height",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: Colors.white,
          ),
          keyboardType: TextInputType.number,
          onChanged: (_) => onChanged(),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: weightController,
          decoration: InputDecoration(
            hintText: "Enter your weight (kg)",
            labelText: "Weight",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: Colors.white,
          ),
          keyboardType: TextInputType.number,
          onChanged: (_) => onChanged(),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
