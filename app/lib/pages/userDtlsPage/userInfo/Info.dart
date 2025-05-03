import 'package:app/pages/loginPage/db/db_function.dart';
import 'package:app/pages/loginPage/login.dart';
import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () async {
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: Text("Are youn sure."),
                  actions: [
                    ElevatedButton(
                      onPressed: () async {
                        await deleteUser();
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: Text("Yes"),
                    ),
                  ],
                ),
          );
        },
        child: Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.red,
          ),
          child: Center(
            child: Text("Logout", style: commentStyle(20, Colors.white)),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 223, 223, 223),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 30,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Container(
                            child: Center(child: Icon(Icons.person)),
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 223, 223, 223),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text("Profile"),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "UserName",
                        style: TextStyle(
                          color: const Color.fromARGB(187, 160, 160, 160),
                        ),
                      ),
                      Text(
                        "Goal Level",
                        style: TextStyle(
                          color: const Color.fromARGB(187, 160, 160, 160),
                        ),
                      ),
                      Text(
                        "Height",
                        style: TextStyle(
                          color: const Color.fromARGB(187, 160, 160, 160),
                        ),
                      ),
                      Text(
                        "Weight",
                        style: TextStyle(
                          color: const Color.fromARGB(187, 160, 160, 160),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("User"),
                      Text("4 days"),
                      Text("176(cm)"),
                      Text("76(kg)"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
