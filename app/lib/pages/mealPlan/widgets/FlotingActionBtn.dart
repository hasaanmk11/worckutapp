import 'package:app/pages/mealPlan/addPage.dart';

import 'package:flutter/material.dart';

class FlotingActionBtn extends StatelessWidget {
  final catgryName;
  const FlotingActionBtn({super.key, this.catgryName});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        addMEal(context, catgryName);
      },
      backgroundColor: Colors.blueAccent,
      child: const Icon(Icons.add),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
