import 'package:app/pages/transformation/const/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveLastPhotoDate(DateTime date) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(lastPhotoKey, date.toString());
}
