import 'dart:typed_data';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:app/styles/cmn.dart';
import 'package:app/admin/pages/meal_planner/activitie/Model/activity_model.dart';
import 'package:app/admin/pages/meal_planner/activitie/db/activity_db_functions.dart';

class EditActivity extends StatefulWidget {
  final String initialActivity;
  final int initialTime;
  final int id;
  final Object? image;

  const EditActivity({
    required this.image,
    required this.initialActivity,
    required this.initialTime,
    required this.id,
  });

  @override
  State<EditActivity> createState() => _EditActivityState();
}

class _EditActivityState extends State<EditActivity> {
  List<String> activities = ["Meditation", "Yoga", "Cycling", "Swimming"];
  late String selectedActivity;
  late int selectedTime;
  late int ids;
  String? imagePath;
  Uint8List? imageBytes;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    selectedActivity = widget.initialActivity;
    selectedTime = widget.initialTime;
    ids = widget.id;

    if (widget.image is Uint8List) {
      imageBytes = widget.image as Uint8List;
    } else if (widget.image is String) {
      imagePath = widget.image as String;
    }
  }

  Future<void> _pickImage() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      if (kIsWeb) {
        final bytes = await picked.readAsBytes();
        setState(() {
          imageBytes = bytes;
          imagePath = null;
        });
      } else {
        final path = picked.path;
        setState(() {
          imagePath = path;
          imageBytes = null;
        });
      }
    }
  }

  Widget _buildImagePreview() {
    if (imageBytes != null) {
      return Image.memory(
        imageBytes!,
        height: 100,
        width: 100,
        fit: BoxFit.cover,
      );
    } else if (imagePath != null) {
      return Image.file(
        File(imagePath!),
        height: 100,
        width: 100,
        fit: BoxFit.cover,
      );
    } else {
      return const Text("No image selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Edit Activity", style: commentStyle(18, Colors.black)),
            const SizedBox(height: 20),

            _buildImagePreview(),
            TextButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.image),
              label: const Text("Change Image"),
            ),
            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
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
            const SizedBox(height: 20),

            DropdownButtonFormField<int>(
              value: selectedTime,
              decoration: const InputDecoration(
                labelText: 'Time (minutes)',
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
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                final data = ActivityModel(
                  id: ids,
                  activity: selectedActivity,
                  time: selectedTime.toString(),
                  imageBytes: imageBytes,
                  imagePath: imagePath,
                );

                editeActivity(ids, data);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child: const Text(
                "Update",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
