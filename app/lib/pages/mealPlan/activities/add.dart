import 'dart:io' show File;
import 'package:app/pages/mealPlan/activities/activityModel/activity_model.dart';
import 'package:app/pages/mealPlan/activities/db/activity_db_functions.dart';
import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Addactivity extends StatefulWidget {
  const Addactivity({super.key});

  @override
  State<Addactivity> createState() => _ActivitieState();
}

class _ActivitieState extends State<Addactivity> {
  List<String> activities = ["Meditation", "Yoga", "Cycling", "Swimming"];
  String selectedActivity = "Meditation";

  File? pickedImage;

  Future<void> pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        pickedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var selectedTime = 5;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          "Activities",
                          style: commentStyle(20, Colors.black),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: DropdownButtonFormField<String>(
                            value: selectedActivity,
                            decoration: const InputDecoration(
                              labelText: 'Choose Activity',
                              border: OutlineInputBorder(),
                            ),
                            items:
                                activities.map((String activity) {
                                  return DropdownMenuItem<String>(
                                    value: activity,
                                    child: Text(activity),
                                  );
                                }).toList(),
                            onChanged: (val) {
                              setState(() {
                                selectedActivity = val!;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: DropdownButtonFormField<int>(
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
                                setState(() {
                                  selectedTime = val!;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: pickImageFromGallery,
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 207, 206, 206),
                            ),
                            child:
                                pickedImage == null
                                    ? Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(Icons.image_outlined),
                                          SizedBox(height: 5),
                                          Text(
                                            "Pick image",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                    : ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.file(
                                        pickedImage!,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                    ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            final data = ActivityModel(
                              image: pickedImage!.path, // Save the file path
                              activity: selectedActivity,
                              time: selectedTime.toString(),
                              id: DateTime.now().millisecondsSinceEpoch,
                            );

                            await addDataActivity(data);
                            Navigator.of(context).pop();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.purple,
                            ),
                          ),
                          child: Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
