import 'package:flutter/material.dart';

import '../constants.dart';
import 'icon_btn_with_counter.dart';

AppBar buildAppBar(BuildContext context,
    {bool isTransparent = false, String title}) {
  return AppBar(
    backgroundColor: isTransparent ? Colors.transparent : Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.menu,
        color: kIconColor,
      ),
      onPressed: () {},
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
