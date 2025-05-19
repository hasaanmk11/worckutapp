import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

class playIcon extends StatelessWidget {
  const playIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        radius: 20,
        backgroundColor: commenColor(),
        child: const Icon(Icons.play_arrow, color: Colors.black),
      ),
    );
  }
}
