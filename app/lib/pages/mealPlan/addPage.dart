import 'package:flutter/material.dart';
import 'package:app/styles/cmn.dart'; // Make sure this exists and includes commentStyle()

void addMEal(BuildContext context) {
  final TextEditingController textController = TextEditingController();

  String selectedTime = "Morning";
  int selectedValue1 = 1;
  int selectedValue2 = 1;
  List<String> time = ["Morning", "AfterNoon", "Evening", "Night"];

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
                Text("Add Food", style: commentStyle(20, Colors.black)),
                SizedBox(height: 12),
                Container(
                  width: MediaQuery.of(context).size.width - 60,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(Icons.fastfood, size: 60),
                ),
                SizedBox(height: 8),
                Text("Pick Image", style: commentStyle(16, Colors.black)),
                SizedBox(height: 16),

                TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    labelText: 'Food Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 150,
                    height: 60,
                    child: DropdownButtonFormField<String>(
                      value: selectedTime,
                      decoration: InputDecoration(
                        labelText: 'Choose Time',
                        border: OutlineInputBorder(),
                      ),
                      items:
                          time.map((String timeOption) {
                            return DropdownMenuItem<String>(
                              value: timeOption,
                              child: Text(timeOption),
                            );
                          }).toList(),
                      onChanged: (val) {
                        selectedTime = val!;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16),

                TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    labelText: 'Protein(g)',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    labelText: 'Calories(g)',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    labelText: 'Fat(g)',
                    border: OutlineInputBorder(),
                  ),
                ),

                ElevatedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    Navigator.of(context).pop();
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
