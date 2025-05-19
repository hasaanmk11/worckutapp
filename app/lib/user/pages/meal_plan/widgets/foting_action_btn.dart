
import 'package:app/styles/cmn.dart';
import 'package:app/user/pages/meal_plan/add_page.dart';
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
      backgroundColor: commenColor(),
      child: const Icon(Icons.add),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
