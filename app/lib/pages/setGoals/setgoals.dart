import 'package:app/pages/setGoals/timeChoose/time.dart';
import 'package:app/pages/setGoals/widgets/FitnessWd.dart';
import 'package:app/pages/setGoals/widgets/activityWd.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class Setgoals extends StatefulWidget {
  const Setgoals({super.key});

  @override
  _SetgoalsState createState() => _SetgoalsState();
}

class _SetgoalsState extends State<Setgoals> {
  String selectedMonth = "January";
  int daysInMonth = 31;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              FitnessCardOfSetGoal(),
              const SizedBox(height: 50),
              ActivityText(),
              const SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) {
                            final months = List.generate(12, (index) {
                              return DateFormat.MMMM().format(
                                DateTime(0, index + 1),
                              );
                            });

                            return Padding(
                              padding: const EdgeInsets.all(20),
                              child: Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children:
                                    months.map((month) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedMonth = month;
                                            daysInMonth = getDaysInMonth(month);
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 12,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.deepPurple,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Text(
                                            month,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        selectedMonth,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(daysInMonth, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      width: 80,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 231, 158, 0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "${index + 1}",
                          style: const TextStyle(
                            fontSize: 50,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
