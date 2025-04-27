import 'package:app/pages/mealPlan/addPage.dart';
import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

class Mealadd extends StatelessWidget {
  final Name;
  const Mealadd({super.key, this.Name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addMEal(context);
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text("${Name}", style: commentStyle(20, Colors.black)),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 30,
                height: 250,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 197, 197, 197),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Food Name: Rice"),
                          SizedBox(height: 6),
                          Text("Protein: 3g"),
                          SizedBox(height: 6),
                          Text("Calories: 100g"),
                          SizedBox(height: 6),
                          Text("Fat: 50g"),
                          SizedBox(height: 6),
                          Text("Time: Morning"),
                        ],
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.purple,
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Edit",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.person),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Pick Image",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.red,
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Delete",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
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
