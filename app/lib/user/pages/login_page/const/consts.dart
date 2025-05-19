

import 'package:app/user/pages/login_page/model/login_model.dart';
import 'package:flutter/material.dart';

final formKey = GlobalKey<FormState>();
const userId='userData';
final TextEditingController emailController = TextEditingController();
final TextEditingController passController = TextEditingController();
var regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
final ValueNotifier<List<UserModel>> userDtlsListener=ValueNotifier([]);
