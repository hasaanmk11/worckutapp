class CalculatePlan {
  static Map<String, double> calculate(String heightText, String weightText) {
    double height = double.tryParse(heightText) ?? 0;
    double weight = double.tryParse(weightText) ?? 0;

    double cardioMinutes = 0;
    double caloriesTarget = 0;
    double waterLiters = 0;

    if (height > 0 && weight > 0) {
      cardioMinutes = 30 + (weight * 0.1);
      double maintenanceCalories = weight * 22;
      caloriesTarget = maintenanceCalories - 400;
      waterLiters = weight * 0.033;
    }

    return {
      'cardioMinutes': cardioMinutes,
      'caloriesTarget': caloriesTarget,
      'waterLiters': waterLiters,
    };
  }
}
