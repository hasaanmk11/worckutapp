import 'package:app/admin/const/const.dart';
import 'package:app/admin/pages/workout_catogories/db/workout_db.dart';
import 'package:app/admin/pages/workout_catogories/model/model.dart';

import 'package:flutter/material.dart';

void editeCard(BuildContext context, Bignnermodel Items) {
  final TextEditingController textController = TextEditingController(
    text: Items.workoutName,
  );

  final TextEditingController _youtubeUrlController = TextEditingController();
  const String urlHint = 'https://www.youtube.com/watch?v=...';
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
                TextFormField(
                  controller: _youtubeUrlController,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'YouTube Video URL',
                    labelStyle: const TextStyle(color: Colors.black),
                    hintText: urlHint,
                    hintStyle: const TextStyle(color: Colors.white38),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  validator: (value) {
                    final regExp = RegExp(pattern);
                    if (!regExp.hasMatch(value!)) {
                      return 'Enter a valid YouTube URL';
                    }
                    return null;
                  },
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
                      url: _youtubeUrlController.text,
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
