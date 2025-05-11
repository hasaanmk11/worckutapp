

import 'package:app/pages/transformation/db/db.dart';
import 'package:app/pages/transformation/model/transformtion.dart';
import 'package:app/pages/transformation/functions/savelastphotodate.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


Future<void> takeWeeklyPhoto({
  required BuildContext context,
  required DateTime? lastPhotoTakenDate,
  required Function(DateTime) onPhotoTaken,
}) async {
  final ImagePicker _picker = ImagePicker();
  final now = DateTime.now();

  if (lastPhotoTakenDate != null) {
    final difference = now.difference(lastPhotoTakenDate).inDays;
    if (difference < 7) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'You can take your next photo in ${7 - difference} days.',
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }
  }

  final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
  if (photo != null) {
    final result = Transformtion(image: photo.path);
    await addTransformationImage(result);
    await saveLastPhotoDate(now);

    onPhotoTaken(now);
  }
}
