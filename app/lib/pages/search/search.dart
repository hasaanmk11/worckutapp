import 'package:app/pages/categories/bignner/db/DbFunction.dart';
import 'package:app/pages/search/Widgets/searchCards.dart';
import 'package:app/pages/search/Widgets/searchDropdown.dart';
import 'package:app/pages/search/Widgets/searchFeildWdgets.dart';

import 'package:flutter/material.dart';

class SearchWorkoutPage extends StatefulWidget {
  const SearchWorkoutPage({Key? key}) : super(key: key);

  @override
  State<SearchWorkoutPage> createState() => _SearchWorkoutPageState();
}

class _SearchWorkoutPageState extends State<SearchWorkoutPage> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getDataWithId(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        title: const Text(
          "Search Workout",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        leading: const BackButton(color: Colors.black),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchFeild(searchController: searchController),
              const SizedBox(height: 20),
              const Center(child: DropdownButtons()),
              const SizedBox(height: 30),
              const Text(
                "Your Set Goals",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 15),
              SearchCards(),
            ],
          ),
        ),
      ),
    );
  }
}

