import 'package:flutter/material.dart';

class WarmUpCrad extends StatelessWidget {
  const WarmUpCrad({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 119, 119, 119).withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
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

          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, right: 150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Warm-Up First!",
                  style: TextStyle(
                    color: Colors.white,
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
                      color: Colors.white,
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
