import 'package:app/db_init/db_init.dart';
import 'package:app/user/pages/main/main_function.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}
 