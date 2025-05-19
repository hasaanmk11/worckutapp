
import 'package:app/user/pages/transformation/const/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isWeekendApproaching() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? dateString = prefs.getString(lastPhotoKey);

  if (dateString == null) return false;

  DateTime? lastPhotoTakenDate = DateTime.tryParse(dateString);
  if (lastPhotoTakenDate == null) return false;

  final now = DateTime.now();
  final difference = now.difference(lastPhotoTakenDate).inDays;

  if (difference >= 7) {
    notificationCound.value = true;
    return true;
  } else {
    notificationCound.value = false;
    return false;
  }

  // await Future.delayed(Duration(seconds: 2));
  // notificationCound.value = true;
  // return true;
}
