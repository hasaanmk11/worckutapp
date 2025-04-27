import 'package:app/pages/categories/db/db.dart';
import 'package:app/pages/categories/model/md.dart';
import 'package:app/pages/categories/bignner/add.dart';

import 'package:app/pages/categories/widgets/ctgryCrad/crad.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/cmn.dart';

class Advanced extends StatelessWidget {
  const Advanced({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                onPressed: () {
                  showCustomDialog(context);
                },
                icon: Icon(Icons.add, color: Colors.black, size: 30),
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 212, 212, 212),
        body: Padding(
          padding: const EdgeInsets.only(top: 120, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Advanced",
                    style: commentStyle(25, Colors.black),
                  ),
                ),
                const SizedBox(height: 40),

                ValueListenableBuilder(
                  valueListenable: beginners,
                  builder: (
                    BuildContext context,
                    List<WorkoutModel> value,
                    Widget? child,
                  ) {
                    if (value.isEmpty) {
                      return const Center(
                        child: Text(
                          "No workouts added yet",
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    }

                    return ctgryCrad(value.cast<WorkoutModel>());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
