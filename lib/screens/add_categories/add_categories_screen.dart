import 'package:flutter/material.dart';

import 'package:managing_home_v004/components/custom_bottom_nav_bar.dart';
import 'package:managing_home_v004/components/icon_btn_with_counter.dart';
import 'package:managing_home_v004/constants.dart';
import 'package:managing_home_v004/enums.dart';
import 'package:managing_home_v004/screens/add_categories/components/category.dart';

import 'components/body.dart';

class AddCategoriesScreen extends StatelessWidget {
  static String routeName = "/add_categories";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "정리 위치 추가"),
      body: Body(Category('', '', '', '')),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.home,
      ),
    );
  }
}

AppBar buildAppBar(BuildContext context,
    {bool isTransparent = false, String title}) {
  return AppBar(
    backgroundColor: isTransparent ? Colors.transparent : Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: kIconColor,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
    title: !isTransparent
        ? Text(
            isTransparent ? "" : title,
            style: TextStyle(color: kTextColor),
          )
        : null,
    centerTitle: true,
    actions: [
      IconButton(
        icon: Icon(
          Icons.search,
          color: kIconColor,
        ),
        // SvgPicture.asset('assets/icons/Search Icon.svg'),
        onPressed: () {},
      ),
      IconBtnWithCounter(
        svgSrc: "assets/icons/Bell.svg",
        numOfitem: 3,
        press: () {},
      ),
    ],
  );
}
