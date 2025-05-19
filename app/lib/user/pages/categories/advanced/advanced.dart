
import 'package:app/admin/pages/workout_catogories/db/workout_db.dart';
import 'package:app/admin/pages/workout_catogories/model/model.dart';
import 'package:app/user/pages/categories/advanced/widgets/tittle.dart';


import 'package:app/user/pages/categories/widgets/ctgry_crad/crad.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/cmn.dart';

class Advanced extends StatefulWidget {
  Advanced({super.key});

  @override
  State<Advanced> createState() => _AdvancedState();
}

class _AdvancedState extends State<Advanced> {
  int advanced = 3;
  @override
  void initState() {
    getDataWithId(advanced);
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
                  child: advancedScreenTittleCard(),
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

                    return categorieCard(value, advanced);
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

