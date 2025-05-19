import 'package:app/admin/pages/workout_catogories/db/workout_db.dart';
import 'package:flutter/material.dart';

deleteAlrtCard(workout,ctx){

   showDialog(
    context: ctx,
    builder:
        (context) => AlertDialog(
          title: const Text("Confirm Delete"),
          content: const Text("Are you sure you want to delete this workout?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                deleteCrad(
                  workout.id,
                  workout.categoryId,
                );
                Navigator.of(context).pop(); 
              },
              child: const Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
  );
}