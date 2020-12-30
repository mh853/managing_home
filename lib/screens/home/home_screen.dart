import 'package:flutter/material.dart';
import 'package:managing_home_v004/components/app_bar.dart';
import 'package:managing_home_v004/components/custom_bottom_nav_bar.dart';

import '../../enums.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  HomeScreen({this.uid});
  final String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "집 정리"),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.home,
      ),
    );
  }
}
