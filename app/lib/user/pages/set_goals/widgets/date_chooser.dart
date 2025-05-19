

import 'package:app/user/pages/set_goals/time_choose/time.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Datechooser extends StatefulWidget {
  const Datechooser({super.key});

  @override
  State<Datechooser> createState() => _DatechooserState();
}

class _DatechooserState extends State<Datechooser> {
    String selectedMonth = "January";
  int daysInMonth = 31;
  @override
  Widget build(BuildContext context) {
     


    return Row(
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
            );
  }

  }
