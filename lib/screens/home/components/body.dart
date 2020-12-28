import 'package:flutter/material.dart';

import 'package:managing_home_v004/components/title_text.dart';
import 'package:managing_home_v004/constants.dart';
// import 'package:managing_home_v004/models/addItems.dart';
import 'package:managing_home_v004/screens/add_categories/add_categories_screen.dart';

// import 'package:managing_home_v004/services/fetchCategories.dart';
// import 'package:managing_home_v004/services/fetchItems.dart';
import '../../../size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double defaultSize = SizeConfig.defaultSize;

  @override
  Widget build(BuildContext context) {
    return BuildCategoriesList();
  }
}

class BuildCategoriesList extends StatefulWidget {
  final String buttonText;
  BuildCategoriesList({this.buttonText});

  @override
  _BuildCategoriesListState createState() => _BuildCategoriesListState();
}

class _BuildCategoriesListState extends State<BuildCategoriesList> {
  @override
  Widget build(BuildContext context) {
    // double defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      body: _buildCategories(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Navigator.pushNamed(context, AddCategoriesScreen.routeName);
        },
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('categories').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data.documents);
      },
    );
    // TODO: get actual snapshot from Cloud Firestore
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.id),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.title),
          trailing: Text(record.numOfItems.toString()),
          onTap: () => print(record),
        ),
      ),
    );
  }
}

class Record {
  final String title;
  final int id;
  final int numOfItems;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['title'] != null),
        assert(map['id'] != null),
        assert(map['numOfItems'] != null),
        title = map['title'],
        numOfItems = map['numOfItems'],
        id = map['id'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Record<$id:$title>";
}
