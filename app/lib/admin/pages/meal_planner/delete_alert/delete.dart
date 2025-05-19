
import 'package:app/admin/pages/meal_planner/db/db_function.dart';
import 'package:flutter/material.dart';

void adminDeleteAlert(BuildContext context, catagorieId, cardid) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Confirm Delete"),
        content: Text("Are you sure you want to delete this activity?"),
        actions: [
          TextButton(
            child: Text("Cancel"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text("Delete", style: TextStyle(color: Colors.red)),
            onPressed: () async {
              await deleteMmeal(catagorieId, cardid);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
