import 'dart:io';
import 'dart:typed_data';

import 'package:app/responsive/home_screen_layouts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:app/styles/cmn.dart';
import 'package:app/admin/pages/meal_planner/activitie/Model/activity_model.dart';
import 'package:app/admin/pages/meal_planner/activitie/db/activity_db_functions.dart';

class AdminAddactivity extends StatefulWidget {
  const AdminAddactivity({super.key});

  @override
  State<AdminAddactivity> createState() => _ActivitieState();
}

class _ActivitieState extends State<AdminAddactivity> {
  List<String> activities = ["Meditation", "Yoga", "Cycling", "Swimming"];
  String selectedActivity = "Meditation";
  int selectedTime = 5;

  File? pickedImageFile;
  Uint8List? pickedImageBytes;

  Future<void> pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      if (kIsWeb) {
        final bytes = await pickedFile.readAsBytes();
        setState(() {
          pickedImageBytes = bytes;
        });
      } else {
        setState(() {
          pickedImageFile = File(pickedFile.path);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            final layout = ScreenLayouts(constraints: constraints);
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
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

                          // Dropdowns
                          Center(
                            child: SizedBox(
                              width: layout.isMobile ? double.infinity : 800,
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
                          ),
                          const SizedBox(height: 20),

                          Center(
                            child: SizedBox(
                              width: layout.isMobile ? double.infinity : 800,
                              child: DropdownButtonFormField<int>(
                                value: selectedTime,
                                decoration: const InputDecoration(
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

                          // Image Picker
                          Center(
                            child: GestureDetector(
                              onTap: pickImageFromGallery,
                              child: Container(
                                width: layout.isMobile ? double.infinity : 800,
                                height: layout.isMobile ? double.infinity : 400,
                                constraints: const BoxConstraints(
                                  minHeight: 150,
                                  maxHeight: 250,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color.fromARGB(
                                    255,
                                    207,
                                    206,
                                    206,
                                  ),
                                ),
                                child:
                                    pickedImageBytes != null ||
                                            pickedImageFile != null
                                        ? ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          child:
                                              kIsWeb
                                                  ? Image.memory(
                                                    pickedImageBytes!,
                                                    fit: BoxFit.cover,
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                  )
                                                  : Image.file(
                                                    pickedImageFile!,
                                                    fit: BoxFit.cover,
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                  ),
                                        )
                                        : const Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
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
                                        ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Save Button
                          Center(
                            child: ElevatedButton(
                              onPressed: () async {
                                if (pickedImageBytes == null &&
                                    pickedImageFile == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Please select an image"),
                                    ),
                                  );
                                  return;
                                }

                                final model = ActivityModel(
                                  activity: selectedActivity,
                                  time: selectedTime.toString(),
                                  id: DateTime.now().millisecondsSinceEpoch,
                                  imagePath:
                                      kIsWeb ? null : pickedImageFile!.path,
                                  imageBytes: kIsWeb ? pickedImageBytes : null,
                                );

                                await addDataActivity(model);
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple,
                              ),
                              child: const Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
