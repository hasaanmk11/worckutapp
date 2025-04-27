import 'package:app/pages/search/Widgets/searchDropdown.dart';
import 'package:app/pages/search/Widgets/searchFeildWdgets.dart';
import 'package:flutter/material.dart';

class SearchWorkoutPage extends StatefulWidget {
  const SearchWorkoutPage({Key? key}) : super(key: key);

  @override
  State<SearchWorkoutPage> createState() => _SearchWorkoutPageState();
}

class _SearchWorkoutPageState extends State<SearchWorkoutPage> {
  String selectedLevel = "Advanced";
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7E2E2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchFeild(searchController: searchController),
              const SizedBox(height: 20),

              Center(child: DropdownButtons()),
              const SizedBox(height: 150),

              const Center(
                child: Text(
                  "Not found .",
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
