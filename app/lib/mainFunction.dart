import 'package:app/pages/dbInit/db.dart';
import 'package:app/pages/main/main.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}
