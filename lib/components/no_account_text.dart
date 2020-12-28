import 'package:flutter/material.dart';

import 'package:managing_home_v004/screens/sign_up/sign_up_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
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
          onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
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
