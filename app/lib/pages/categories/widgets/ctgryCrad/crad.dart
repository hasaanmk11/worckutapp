import 'dart:io';

import 'package:app/pages/categories/bignner/model/bignnermodel.dart';
import 'package:app/pages/categories/widgets/catgryButton/buttons.dart';
import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

ListView ctgryCrad(List<Bignnermodel> value, int categoryID) {
  return ListView.separated(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: value.length,
    separatorBuilder: (context, index) => const SizedBox(height: 20),
    itemBuilder: (context, index) {
      final workout = value[index];

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 195, 195, 195),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Name: ${workout.workoutName}",
                  style: commentStyle(20, Colors.black),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(File(workout.image)),
                  ),
                ),
              ],
            ),
            Text(
              "Duration: ${workout.time}",
              style: commentStyle(20, Colors.black),
            ),
            Text("Set: ${workout.set}", style: commentStyle(20, Colors.black)),
            Text("Rep: ${workout.rep}", style: commentStyle(20, Colors.black)),
            const SizedBox(height: 10),
            CatgtyFunctionsButton(item: workout, categoryID: categoryID),
          ],
        ),
      );
    },
  );
}
