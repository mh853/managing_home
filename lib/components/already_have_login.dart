import 'package:flutter/material.dart';
import 'package:managing_home_v004/screens/login/login_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class AlreadyHaveLogin extends StatelessWidget {
  const AlreadyHaveLogin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "이미 계정이 있으신가요?",
          style: TextStyle(fontSize: getProportionateScreenWidth(13)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, LoginScreen.routeName),
          child: Text(
            "로그인하기",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(13),
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
