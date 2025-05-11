
import 'package:app/pages/mealPlan/mealAdd.dart';
import 'package:flutter/material.dart';

class WeightlossCrad extends StatelessWidget {
  const WeightlossCrad({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Mealadd(),
            ),
          ),
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        height: 200,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/meal2.webp",
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Weight Loss",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
