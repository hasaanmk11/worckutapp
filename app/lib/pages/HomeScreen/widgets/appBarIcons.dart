import 'package:app/pages/userDtlsPage/userInfo/Info.dart';
import 'package:flutter/material.dart';

class AppBarIcons extends StatelessWidget {
  const AppBarIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
          height: 30,
          width: 30,
          child: Center(
            child: InkWell(
              onTap:
                  () => Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => Info())),
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),
        ),
        Container(
          height: 30,
          width: 30,
          child: Center(child: Image.asset("assets/notofication.png")),
        ),
      ],
    );
  }
}
