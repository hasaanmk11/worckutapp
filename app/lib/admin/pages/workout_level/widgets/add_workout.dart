import 'dart:io';


import 'package:app/admin/const/const.dart';
import 'package:app/admin/pages/workout_catogories/db/workout_db.dart';
import 'package:app/admin/pages/workout_catogories/model/model.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void showCustomDialog(BuildContext context, int categoryID) {
  final TextEditingController textController = TextEditingController();
  ValueNotifier<String> caloriesImages = ValueNotifier<String>("");
  final TextEditingController _youtubeUrlController = TextEditingController();

  int selectedTime = 5;
  int setChooser = 1;
  int repChooser = 1;

  Future<void> pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      caloriesImages.value = pickedFile.path;
    }
  }

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
                GestureDetector(
                  onTap: pickImageFromGallery,
                  child: ValueListenableBuilder<String>(
                    valueListenable: caloriesImages,
                    builder: (context, imagePath, _) {
                      return CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            imagePath.isNotEmpty
                                ? FileImage(File(imagePath))
                                : null,
                        backgroundColor: Colors.grey[300],
                        child:
                            imagePath.isEmpty
                                ? Icon(
                                  Icons.add_a_photo,
                                  size: 30,
                                  color: Colors.black54,
                                )
                                : null,
                      );
                    },
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
                    hintText: 'https://www.youtube.com/watch?v=...',
                    hintStyle: const TextStyle(color: Colors.white38),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a YouTube URL';
                    }
                   
                    final regExp = RegExp(pattern);
                    if (!regExp.hasMatch(value)) {
                      return 'Enter a valid YouTube URL';
                    }
                    return null;
                  },
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
                  },
                ),
                SizedBox(height: 16),

                DropdownButtonFormField<int>(
                  value: setChooser,
                  decoration: InputDecoration(
                    labelText: 'Choose Set',
                    border: OutlineInputBorder(),
                  ),
                  items: List.generate(50, (index) {
                    return DropdownMenuItem(
                      value: index + 1,
                      child: Text('${index + 1}'),
                    );
                  }),
                  onChanged: (val) {
                    setChooser = val!;
                  },
                ),
                SizedBox(height: 16),

                DropdownButtonFormField<int>(
                  value: repChooser,
                  decoration: InputDecoration(
                    labelText: 'Choose Rep',
                    border: OutlineInputBorder(),
                  ),
                  items: List.generate(50, (index) {
                    return DropdownMenuItem(
                      value: index + 1,
                      child: Text('${index + 1}'),
                    );
                  }),
                  onChanged: (val) {
                    repChooser = val!;
                  },
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  child: Text('Submit'),
                  onPressed: () async {
                    if (textController.text.isEmpty) {
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: Text('Error'),
                              content: Text("Please enter a workout name."),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                      );
                    } else {
                      final newWorkout = Bignnermodel(
                        image: caloriesImages.value,
                        rep: repChooser.toString(),
                        set: setChooser.toString(),
                        time: selectedTime.toString(),
                        workoutName: textController.text,
                        categoryId: categoryID,
                        id: DateTime.now().microsecondsSinceEpoch,
                        url:
                            YoutubePlayer.convertUrlToId(
                              _youtubeUrlController.text,
                            ) ??
                            '',
                      );

                      await BignnerDb.addBignner(newWorkout);
                      await getDataWithId(categoryID);
                      Navigator.pop(context);
                    }
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
