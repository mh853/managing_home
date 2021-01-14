//new category.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:managing_home_v004/constants.dart';
import 'category.dart';
import 'firestoreservice.dart';
//import 'createtodo.dart';

class Body extends StatefulWidget {
  final Category category;
  Body(this.category);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FirestoreService fireServ = new FirestoreService();

  TextEditingController _categoryNameController;
  TextEditingController _categoryDetailsController;
  TextEditingController _categoryDateController;
  TextEditingController _categoryTimeController;

  // int _myCategoryType = 0;
  // String categoryVal;
  // void _handlecategoryType(int value) {
  //   setState(() {
  //     _myCategoryType = value;
  //     switch (_myCategoryType) {
  //       case 1:
  //         categoryVal = 'travel';
  //         break;
  //       case 2:
  //         categoryVal = 'shopping';
  //         break;
  //       case 3:
  //         categoryVal = 'gym';
  //         break;
  //       case 4:
  //         categoryVal = 'party';
  //         break;
  //       case 5:
  //         categoryVal = 'others';
  //         break;
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();

    _categoryNameController =
        new TextEditingController(text: widget.category.categoryname);
    _categoryDetailsController =
        new TextEditingController(text: widget.category.categorydetails);
    _categoryDateController =
        new TextEditingController(text: widget.category.categorydate);
    _categoryTimeController =
        new TextEditingController(text: widget.category.categorytime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // _myAppBar(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: TextField(
                      controller: _categoryNameController,
                      decoration: InputDecoration(labelText: "정리 위치: "),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: TextField(
                      controller: _categoryDetailsController,
                      decoration: InputDecoration(labelText: "Details: "),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Text(
                      'Select category Type:',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: <Widget>[
                  //         Radio(
                  //           value: 1,
                  //           groupValue: _myCategoryType,
                  //           onChanged: _handlecategoryType,
                  //           activeColor: Color(0xff4158ba),
                  //         ),
                  //         Text(
                  //           'Travel',
                  //           style: TextStyle(fontSize: 16.0),
                  //         ),
                  //       ],
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: <Widget>[
                  //         Radio(
                  //           value: 2,
                  //           groupValue: _myCategoryType,
                  //           onChanged: _handlecategoryType,
                  //           activeColor: Color(0xfffb537f),
                  //         ),
                  //         Text(
                  //           'Shopping',
                  //           style: TextStyle(
                  //             fontSize: 16.0,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: <Widget>[
                  //         Radio(
                  //           value: 3,
                  //           groupValue: _myCategoryType,
                  //           onChanged: _handlecategoryType,
                  //           activeColor: Color(0xff4caf50),
                  //         ),
                  //         Text(
                  //           'Gym',
                  //           style: TextStyle(fontSize: 16.0),
                  //         ),
                  //       ],
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: <Widget>[
                  //         Radio(
                  //           value: 4,
                  //           groupValue: _myCategoryType,
                  //           onChanged: _handlecategoryType,
                  //           activeColor: Color(0xff9962d0),
                  //         ),
                  //         Text(
                  //           'Party',
                  //           style: TextStyle(fontSize: 16.0),
                  //         ),
                  //       ],
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: <Widget>[
                  //         Radio(
                  //           value: 5,
                  //           groupValue: _myCategoryType,
                  //           onChanged: _handlecategoryType,
                  //           activeColor: Color(0xff0dc8f5),
                  //         ),
                  //         Text(
                  //           'Others',
                  //           style: TextStyle(fontSize: 16.0),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                          color: kPrimaryColor,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "취소",
                            style: TextStyle(color: Colors.white),
                          )),
                      // This button results in adding the contact to the database
                      RaisedButton(
                          color: kPrimaryColor,
                          onPressed: () {
                            fireServ
                                .createTODOCategory(
                              _categoryNameController.text,
                              _categoryDetailsController.text,
                              _categoryDateController.text,
                              _categoryTimeController.text,
                            )
                                // categoryVal)
                                .then((_) {
                              Navigator.pop(context);
                            });
                          },
                          child: const Text(
                            "저장",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
