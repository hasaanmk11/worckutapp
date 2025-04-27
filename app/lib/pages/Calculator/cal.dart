import 'package:app/pages/Calculator/function/fn.dart';
import 'package:app/pages/Calculator/widgets/resultPage.dart';
import 'package:app/pages/Calculator/widgets/tab.dart';
import 'package:app/pages/Calculator/widgets/wd.dart';
import 'package:flutter/material.dart';


class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int selectedTab = 0;
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  double cardioMinutes = 0;
  double caloriesTarget = 0;
  double waterLiters = 0;

  void calculatePlan() {
    final result = CalculatePlan.calculate(
      heightController.text,
      weightController.text,
    );
    setState(() {
      cardioMinutes = result['cardioMinutes']!;
      caloriesTarget = result['caloriesTarget']!;
      waterLiters = result['waterLiters']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "Your Goal",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30),

                InputFields(
                  heightController: heightController,
                  weightController: weightController,
                  onChanged: calculatePlan,
                ),

                TabSelector(
                  selectedTab: selectedTab,
                  onTabChanged: (tab) {
                    setState(() {
                      selectedTab = tab;
                      calculatePlan();
                    });
                  },
                ),

                const SizedBox(height: 30),
                const Text(
                  "Your Fat_Burning Game Plan",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                if (selectedTab == 0) ...[
                  TipItem(
                    Icons.directions_run,
                    "Do at least ${cardioMinutes.toStringAsFixed(0)} minutes of cardio 4-5 times a week.",
                  ),
                  TipItem(
                    Icons.restaurant,
                    "Eat around ${caloriesTarget.toStringAsFixed(0)} calories per day.",
                  ),
                  TipItem(
                    Icons.local_drink,
                    "Drink at least ${waterLiters.toStringAsFixed(1)} liters of water daily.",
                  ),
                  TipItem(
                    Icons.bedtime,
                    "Get 7–9 hours of quality sleep each night.",
                  ),
                  TipItem(
                    Icons.monitor_weight,
                    "Monitor your weight and celebrate small wins.",
                  ),
                ] else ...[
                  TipItem(
                    Icons.fitness_center,
                    "Focus on strength training 3-4 times a week.",
                  ),
                  TipItem(
                    Icons.restaurant,
                    "Eat a surplus of 300-500 calories above maintenance.",
                  ),
                  TipItem(
                    Icons.local_drink,
                    "Drink at least ${waterLiters.toStringAsFixed(1)} liters of water daily.",
                  ),
                  TipItem(
                    Icons.bedtime,
                    "Get 8 hours of deep sleep to build muscle.",
                  ),
                  TipItem(
                    Icons.monitor_weight,
                    "Track your weight gains weekly.",
                  ),
                ],

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
