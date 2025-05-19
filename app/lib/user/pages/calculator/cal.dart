import 'package:app/user/pages/calculator/widgets/calculator_strings.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/cmn.dart';
import 'package:app/user/pages/calculator/function/fn.dart';
import 'package:app/user/pages/calculator/widgets/input_feilds.dart';
import 'package:app/user/pages/calculator/widgets/tab.dart';
import 'package:app/user/pages/calculator/widgets/result_page.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int selectedTab = 0;
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  static double cardioMinutes = 0;
  static double caloriesTarget = 0;
  static double waterLiters = 0;

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

  List<Widget> buildFatLossTips() {
    return [
      TipItem(Icons.directions_run, CalculatorStrings.cardioTip(cardioMinutes)),
      TipItem(Icons.restaurant, CalculatorStrings.caloriesTip(caloriesTarget)),
      TipItem(Icons.local_drink, CalculatorStrings.waterTip(waterLiters)),
      const TipItem(Icons.bedtime, CalculatorStrings.sleepTip),
      const TipItem(Icons.monitor_weight, CalculatorStrings.monitorTip),
    ];
  }

  List<Widget> buildWeightGainTips() {
    return [
      const TipItem(
        Icons.fitness_center,
        CalculatorStrings.strengthTrainingTip,
      ),
      const TipItem(Icons.restaurant, CalculatorStrings.surplusTip),
      TipItem(Icons.local_drink, CalculatorStrings.waterTip(waterLiters)),
      const TipItem(Icons.bedtime, CalculatorStrings.weightGainSleepTip),
      const TipItem(Icons.monitor_weight, CalculatorStrings.trackGainsTip),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                // Title
                Center(
                  child: Text(
                    CalculatorStrings.yourGoal,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: commenColor(),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                InputFields(
                  heightController: heightController,
                  weightController: weightController,
                  onChanged: calculatePlan,
                ),

                const SizedBox(height: 20),

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
                  CalculatorStrings.fatBurningPlanTitle,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 20),

                ...(selectedTab == 0
                    ? buildFatLossTips()
                    : buildWeightGainTips()),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
