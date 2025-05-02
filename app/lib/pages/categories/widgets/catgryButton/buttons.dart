import 'package:app/pages/categories/bignner/db/DbFunction.dart';
import 'package:app/pages/categories/bignner/editItem/edite.dart';
import 'package:app/pages/categories/bignner/model/bignnermodel.dart';
import 'package:app/styles/cmn.dart';
import 'package:flutter/material.dart';

class CatgtyFunctionsButton extends StatelessWidget {
  final Bignnermodel item;
  final int categoryID;

  const CatgtyFunctionsButton({
    super.key,
    required this.item,
    required this.categoryID,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 29, 157, 0),
          ),
          child: Text("Done", style: commentStyle(15, Colors.white)),
        ),
        ElevatedButton(
          onPressed: () {
            editeCard(context, item);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
          child: Text("Edit", style: commentStyle(15, Colors.white)),
        ),
        ElevatedButton(
          onPressed: () {
            ShowAlert(context);
          },

          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: Text("Delete", style: commentStyle(15, Colors.white)),
        ),
      ],
    );
  }

  void ShowAlert(BuildContext context) {
     showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Delete"),
          content: Text(
            "Are you sure you want to delete this workout?",
          ),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text(
                "Delete",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                deleteCrad(item.id, categoryID);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
