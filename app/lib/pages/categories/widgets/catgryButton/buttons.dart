import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

class CatgtyFunctionsButton extends StatelessWidget {
  const CatgtyFunctionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 29, 157, 0),
          ),
          child: Text("Done", style: commentStyle(15, Colors.white)),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
          child: Text("Edit", style: commentStyle(15, Colors.white)),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: Text("Delete", style: commentStyle(15, Colors.white)),
        ),
      ],
    );
  }
}
