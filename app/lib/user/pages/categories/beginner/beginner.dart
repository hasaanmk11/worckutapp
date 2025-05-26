import 'package:app/admin/pages/workout_catogories/db/workout_db.dart';
import 'package:app/admin/pages/workout_catogories/model/model.dart';

import 'package:app/user/pages/categories/beginner/widgets/tittle_card.dart';
import 'package:app/user/pages/categories/widgets/ctgry_crad/crad.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/cmn.dart';

class Beginners extends StatefulWidget {
  const Beginners({super.key});

  @override
  State<Beginners> createState() => _BeginnersState();
}

class _BeginnersState extends State<Beginners> {
  int beginners = 1;

  List<Bignnermodel> categoryList = [];

  @override
  void initState() {
    getDataWithId(1);
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
                  child: BeginnerScreenTitleCard(),
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

                    return categorieCard(value, beginners);
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
