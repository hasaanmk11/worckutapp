import 'package:app/pages/userDtlsPage/widgets/height.dart';
import 'package:app/pages/userDtlsPage/widgets/weight.dart';
import 'package:app/pages/welcomePage/welcome.dart';
import 'package:flutter/material.dart';

class dtls extends StatelessWidget {
  const dtls({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(255, 12, 65, 255),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,

                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 191, 190, 190),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(child: Icon(Icons.person)),
                ),
                SizedBox(height: 50),
                Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(child: Text("pick image")),
                ),
                SizedBox(height: 50),
                HeightFld(),
                SizedBox(height: 50),
                WeightFil(),
                SizedBox(height: 50),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => welcome()),
                      (route) => false,
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(child: Text("Select")),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
