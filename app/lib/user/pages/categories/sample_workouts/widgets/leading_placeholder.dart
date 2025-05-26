import 'package:flutter/material.dart';

Widget loadingPlaceholder() {
  return const SizedBox(
    height: 200,
    child: Center(child: CircularProgressIndicator(color: Colors.white)),
  );
}
