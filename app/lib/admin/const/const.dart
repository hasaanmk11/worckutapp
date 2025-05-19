import 'package:flutter/material.dart';

late AnimationController controller;
late Animation<double> fade;

final TextEditingController usernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();


final adminUserName = 'hasanmk';

final adminPassword='1234hallo';


final pattern = r'^https?:\/\/(www\.)?youtube\.com\/watch\?v=.+$';
