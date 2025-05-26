// lib/user/pages/transformation/functions/takephoto.dart
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../db/db.dart';
import '../model/transformtion.dart';
import 'savelastphotodate.dart';

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
    if (kIsWeb) {
      final bytes = await photo.readAsBytes();
      final result = Transformtion(image: photo.name, imageBytes: bytes);
      await addTransformationImage(result);
    } else {
      final result = Transformtion(image: photo.path, imageBytes: null);
      await addTransformationImage(result);
    }

    await saveLastPhotoDate(now);
    onPhotoTaken(now);
  }
}
