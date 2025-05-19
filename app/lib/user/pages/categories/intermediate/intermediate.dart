
import 'package:app/admin/pages/workout_catogories/db/workout_db.dart';
import 'package:app/admin/pages/workout_catogories/model/model.dart';


import 'package:app/user/pages/categories/intermediate/widgets/tittle.dart';
import 'package:app/user/pages/categories/widgets/ctgry_crad/crad.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/cmn.dart';

class Intermediate extends StatefulWidget {
  Intermediate({super.key});

  @override
  State<Intermediate> createState() => _IntermediateState();
}

class _IntermediateState extends State<Intermediate> {
  int intermediate = 2;
  @override
  void initState() {
    getDataWithId(intermediate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,

        body: Padding(
          padding: const EdgeInsets.only(top: 120, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: intermediateScreenTittleCard(),
                ),
                const SizedBox(height: 40),

                ValueListenableBuilder(
                  valueListenable: getDataByLisner,
                  builder: (
                    BuildContext context,
                    List<Bignnermodel> value,
                    Widget? child,
                  ) {
                    if (value.isEmpty) {
                      return const Center(
                        child: Text(
                          "No workouts added yet",
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    }

                    return categorieCard(value, intermediate);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
