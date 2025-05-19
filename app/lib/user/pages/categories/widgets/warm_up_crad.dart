import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

class WarmUpCrad extends StatelessWidget {
  const WarmUpCrad({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
        color: commenColor(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Image.asset("assets/bg.jpg", fit: BoxFit.cover),
            ),
          ),

          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Image.asset(
              "assets/catgry1.png",
              width: 140,
              fit: BoxFit.cover,
            ),
          ),

          // Text content
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, right: 150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Warm-Up First!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "A good warm-up prevents\ninjury and boosts\nperformance. Take 5 minutes\nto prepare your body.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
