import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddCategory extends StatelessWidget {
  final String title;
  final String numOfItems;
  final DateTime createdAtDate;

  AddCategory(this.title, this.numOfItems, this.createdAtDate);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called category that references the firestore collection
    CollectionReference categories =
        FirebaseFirestore.instance.collection('Categories');

    Future<void> addCategories() {
      // Call the user's CollectionReference to add a new user
      return categories
          .add({
            'title': title, // Stokes and Sons
            'numOfItems': numOfItems, // John Doe
            'createdAtDate': createdAtDate // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return FlatButton(
      onPressed: addCategories,
      child: Text(
        "Add Category",
      ),
    );
  }
}
