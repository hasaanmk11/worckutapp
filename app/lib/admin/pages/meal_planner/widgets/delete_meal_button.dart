import 'package:app/admin/pages/meal_planner/delete_alert/delete.dart';
import 'package:app/admin/pages/meal_planner/activitie/db/activity_db_functions.dart';

import 'package:flutter/material.dart';

class adminMealDeleteButton extends StatelessWidget {
  const adminMealDeleteButton({super.key, required this.catagorieId,required this.cradId});
  final catagorieId;
  final cradId;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete, color: Colors.red),
      onPressed: () {
        adminDeleteAlert(context, catagorieId,cradId);
      },
    );
  }
}






