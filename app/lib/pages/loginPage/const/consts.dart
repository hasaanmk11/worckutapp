import 'package:flutter/material.dart';

final formKey = GlobalKey<FormState>();
const userId='userData';
final TextEditingController emailController = TextEditingController();
final TextEditingController passController = TextEditingController();
var regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
