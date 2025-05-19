class CalculatorStrings {
  static const yourGoal = "Your Goal";
  static const fatBurningPlanTitle = "Your Fat_Burning Game Plan";

  // Fat Loss Tips
  static String cardioTip(double minutes) =>
      "Do at least $minutes minutes of cardio 4-5 times a week.";
  static String caloriesTip(double calories) =>
      "Eat around $calories calories per day.";
  static String waterTip(double liters) =>
      "Drink at least ${liters.round()} liters of water daily.";
  static const sleepTip = "Get 7–9 hours of quality sleep each night.";
  static const monitorTip = "Monitor your weight and celebrate small wins.";

  // Weight Gain Tips
  static const strengthTrainingTip =
      "Focus on strength training 3-4 times a week.";
  static const surplusTip =
      "Eat a surplus of 300-500 calories above maintenance.";
  static const weightGainSleepTip =
      "Get 8 hours of deep sleep to build muscle.";
  static const trackGainsTip = "Track your weight gains weekly.";
}
