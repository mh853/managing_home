//new category.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:managing_home_v004/constants.dart';
import 'category.dart';
import 'firestoreservice.dart';
//import 'createtodo.dart';

class Body extends StatefulWidget {
  Body();
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String categoryname, categorydetails, categoryDate, categoryTime;

  getcategoryName(categoryname) {
    this.categoryname = categoryname;
  }

  getcategoryDetails(categorydetails) {
    this.categorydetails = categorydetails;
  }

  getcategoryDate(categoryDate) {
    this.categoryDate = categoryDate;
  }

  getcategoryTime(categoryTime) {
    this.categoryTime = categoryname;
  }

  int _mycategoryType = 0;
  String categoryVal;
  void _handlecategoryType(int value) {
    setState(() {
      _mycategoryType = value;
      switch (_mycategoryType) {
        case 1:
          categoryVal = 'travel';
          break;
        case 2:
          categoryVal = 'shopping';
          break;
        case 3:
          categoryVal = 'gym';
          break;
        case 4:
          categoryVal = 'party';
          break;
        case 5:
          categoryVal = 'others';
          break;
      }
    });
  }

  createData() {
    DocumentReference ds =
        FirebaseFirestore.instance.collection('todolist').doc(categoryname);
    Map<String, dynamic> categorys = {
      "categoryname": categoryname,
      "categorydetails": categorydetails,
      "categorydate": categoryDate,
      "categorytype": categoryVal,
      "categorytime": categoryTime,
    };

    ds.set(categorys).whenComplete(() {
      print("category updated");
    });
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
                      // controller: _categoryNameController,
                      onChanged: (String name) {
                        getcategoryName(name);
                      },
                      decoration: InputDecoration(labelText: "category: "),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: TextField(
                      //controller: _categoryDetailsController,
                      decoration: InputDecoration(labelText: "Details: "),
                      onChanged: (String categorydetails) {
                        getcategoryDetails(categorydetails);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: TextField(
                      // controller: _categoryDateController,
                      decoration: InputDecoration(labelText: "Date: "),
                      onChanged: (String categorydate) {
                        getcategoryDate(categorydate);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: TextField(
                      // controller: _categoryTimeController,
                      decoration: InputDecoration(labelText: "Time: "),
                      onChanged: (String categorytime) {
                        getcategoryTime(categorytime);
                      },
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: _mycategoryType,
                            onChanged: _handlecategoryType,
                            activeColor: Color(0xff4158ba),
                          ),
                          Text(
                            'Travel',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                            value: 2,
                            groupValue: _mycategoryType,
                            onChanged: _handlecategoryType,
                            activeColor: Color(0xfffb537f),
                          ),
                          Text(
                            'Shopping',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                            value: 3,
                            groupValue: _mycategoryType,
                            onChanged: _handlecategoryType,
                            activeColor: Color(0xff4caf50),
                          ),
                          Text(
                            'Gym',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                            value: 4,
                            groupValue: _mycategoryType,
                            onChanged: _handlecategoryType,
                            activeColor: Color(0xff9962d0),
                          ),
                          Text(
                            'Party',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                            value: 5,
                            groupValue: _mycategoryType,
                            onChanged: _handlecategoryType,
                            activeColor: Color(0xff0dc8f5),
                          ),
                          Text(
                            'Others',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ],
                  ),
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
                            createData();
                          },
                          child: const Text(
                            "저장",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _myAppBar() {
    return Container(
      height: 80.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              const Color(0xFFFA7397),
              const Color(0xFFFDDE42),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.arrowLeft,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Text(
                  'New categorys',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
