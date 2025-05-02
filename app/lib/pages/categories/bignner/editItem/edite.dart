import 'dart:io';

import 'package:app/pages/categories/bignner/db/DbFunction.dart';
import 'package:app/pages/categories/bignner/model/bignnermodel.dart';
import 'package:app/pages/categories/db/db.dart';
import 'package:flutter/material.dart';

void editeCard(BuildContext context, Bignnermodel Items) {
  final TextEditingController textController = TextEditingController(
    text: Items.workoutName,
  );

  int selectedTime = 5;
  int SetChooser = 1;
  int RepChooser = 1;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Container(
          padding: EdgeInsets.all(16),
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                ),
                SizedBox(height: 16),

                TextField(
                  controller: textController,

                  decoration: InputDecoration(
                    labelText: 'ADD WORKOUT',

                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                DropdownButtonFormField<int>(
                  value: int.parse(Items.time),
                  decoration: InputDecoration(
                    labelText: 'Choose Time (minutes)',
                    border: OutlineInputBorder(),
                  ),
                  items: List.generate(10, (index) {
                    int val = (index + 1) * 5;
                    return DropdownMenuItem(
                      value: val,
                      child: Text('$val minutes'),
                    );
                  }),
                  onChanged: (val) {
                    selectedTime = val!;
                  },
                ),
                SizedBox(height: 16),

                DropdownButtonFormField<int>(
                  value: int.parse(Items.set),
                  decoration: InputDecoration(
                    labelText: 'Choose Set ',
                    border: OutlineInputBorder(),
                  ),
                  items: List.generate(50, (index) {
                    return DropdownMenuItem(
                      value: index + 1,
                      child: Text('${index + 1}'),
                    );
                  }),
                  onChanged: (val) {
                    SetChooser = val!;
                  },
                ),
                SizedBox(height: 16),

                DropdownButtonFormField<int>(
                  value: int.parse(Items.rep),
                  decoration: InputDecoration(
                    labelText: 'Choose Rep ',
                    border: OutlineInputBorder(),
                  ),
                  items: List.generate(50, (index) {
                    return DropdownMenuItem(
                      value: index + 1,
                      child: Text('${index + 1}'),
                    );
                  }),
                  onChanged: (val) {
                    RepChooser = val!;
                  },
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  child: Text('Submit'),
                  onPressed: () async {
                    final data = Bignnermodel(
                      image: "",
                      rep: RepChooser.toString(),
                      set: SetChooser.toString(),
                      time: selectedTime.toString(),
                      workoutName: textController.text,
                      categoryId: Items.categoryId,
                      id: Items.id,
                    );
                    updateItem(data);

                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
