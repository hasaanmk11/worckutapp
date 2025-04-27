import 'package:app/pages/setGoals/setGoalTimer/timer.dart';
import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

class Start extends StatelessWidget {
  final List<String> workout;

  const Start({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: InkWell(
              onTap:
                  () => Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => TimerPage())),
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(146, 3, 232, 244),
                ),

                child: const Center(
                  child: Text(
                    "Start",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color.fromARGB(255, 233, 230, 230),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset("assets/goalworckut.png", fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 201, 201, 200),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView.separated(
                padding: const EdgeInsets.all(10),
                separatorBuilder:
                    (context, index) => const SizedBox(height: 15),
                itemCount: workout.length,
                itemBuilder:
                    (context, index) => Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[700],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                (index + 1).toString(),
                                style: commentStyle(16, Colors.black),
                              ),
                            ),
                          ),
                          Text(
                            workout[index],
                            style: commentStyle(18, Colors.white),
                          ),
                        ],
                      ),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
