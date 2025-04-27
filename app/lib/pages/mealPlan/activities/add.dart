import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

class Addactivity extends StatefulWidget {
  const Addactivity({super.key});

  @override
  State<Addactivity> createState() => _ActivitieState();
}

class _ActivitieState extends State<Addactivity> {
  List<String> activities = ["Meditation", "Yoga", "Cycling", "Swimming"];
  String selectedActivity = "Meditation";

  @override
  Widget build(BuildContext context) {
    var selectedTime = 5;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 30,
                height: MediaQuery.of(context).size.height - 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text("Activities", style: commentStyle(20, Colors.black)),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: DropdownButtonFormField<String>(
                        value: selectedActivity,
                        decoration: const InputDecoration(
                          labelText: 'Choose Activity',
                          border: OutlineInputBorder(),
                        ),
                        items:
                            activities.map((String activity) {
                              return DropdownMenuItem<String>(
                                value: activity,
                                child: Text(activity),
                              );
                            }).toList(),
                        onChanged: (val) {
                          setState(() {
                            selectedActivity = val!;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        width: 140,
                        height: 50,
                        child: DropdownButtonFormField<int>(
                          value: selectedTime,
                          decoration: InputDecoration(
                            labelText: 'Choose Time (minutes)',
                            border: OutlineInputBorder(),
                          ),
                          items: List.generate(10, (index) {
                            int val = (index + 1) * 5;
                            return DropdownMenuItem(
                              value: val,
                              child: Text('$val minutes'),
                            );
                          }),
                          onChanged: (val) {
                            selectedTime = val!;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 207, 206, 206),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image_outlined),
                            Text(
                              "Pick image",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.purple,
                        ),
                      ),
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
