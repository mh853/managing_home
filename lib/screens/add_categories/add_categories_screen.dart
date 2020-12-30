import 'package:flutter/material.dart';

import 'package:managing_home_v004/components/app_bar.dart';
import 'package:managing_home_v004/components/custom_bottom_nav_bar.dart';
import 'package:managing_home_v004/enums.dart';

import 'components/body.dart';

class AddCategoriesScreen extends StatelessWidget {
  static String routeName = "/add_categories";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "정리 위치 추가"),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.home,
      ),
    );
  }
}
