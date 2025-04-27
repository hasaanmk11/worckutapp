import 'package:app/pages/categories/db/db.dart';
import 'package:app/pages/categories/model/md.dart';
import 'package:flutter/material.dart';

void showCustomDialog(BuildContext context) {
  final TextEditingController textController = TextEditingController();

  int selectedTime = 5;
  int selectedValue1 = 1;
  int selectedValue2 = 1;

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
                  value: selectedTime,
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
                    print("yourTime");
                    print(val);
                  },
                ),
                SizedBox(height: 16),

                DropdownButtonFormField<int>(
                  value: selectedValue1,
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
                    selectedValue1 = val!;
                  },
                ),
                SizedBox(height: 16),

                DropdownButtonFormField<int>(
                  value: selectedValue2,
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
                    selectedValue2 = val!;
                  },
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    final newWorkout = WorkoutModel(
                      name: textController.text,
                      time: selectedTime,
                      set: selectedValue1,
                      rep: selectedValue2,
                    );

                    beginners.value = [...beginners.value, newWorkout];

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
