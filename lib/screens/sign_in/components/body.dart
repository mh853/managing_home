import 'package:flutter/material.dart';
import 'package:managing_home_v004/components/already_have_login.dart';
import 'package:managing_home_v004/components/social_card.dart';
import 'package:managing_home_v004/constants.dart';
import 'package:managing_home_v004/screens/home/home_screen.dart';
import 'package:managing_home_v004/screens/login/login_screen.dart';
import 'package:managing_home_v004/screens/sign_in/components/sign_in(google).dart';
import 'package:managing_home_v004/screens/sign_in/components/social_auth.dart';
import 'package:managing_home_v004/screens/sign_in/components/social_tap.dart';
import 'package:managing_home_v004/screens/sign_up/sign_up_screen.dart';

import '../../../size_config.dart';
import '../../login/components/sign_form.dart';

import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.15),
                Text(
                  "환영합니다",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(30),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Text(
                //   "이메일 주소를 입력하거나 \n소셜을 통해 이용해보세요",
                //   textAlign: TextAlign.center,
                // ),
                SizedBox(height: SizeConfig.screenHeight * 0.18),
                // SignForm(),
                SocialTap(
                  image: 'assets/images/google_image.jpg',
                  text: '구글 계정으로 시작',
                  press: () {
                    signInWithGoogle().then((result) {
                      if (result != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen();
                            },
                          ),
                        );
                      }
                    });
                  },
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                SocialTap(
                  image: 'assets/images/apple_image.gif',
                  text: '애플 계정으로 시작',
                  press: () {},
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                SocialTap(
                  image: 'assets/images/mail_image.png',
                  text: '이메일로 시작',
                  press: () {
                    Navigator.pushNamed(context, SignUpScreen.routeName);
                  },
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                SocialTap(
                  image: 'assets/images/kakao_image.png',
                  text: '카카오 계정으로 시작',
                  press: () {},
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                SocialTap(
                  image: 'assets/images/naver_image.png',
                  text: '네이버 계정으로 시작',
                  press: () {},
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                SizedBox(height: getProportionateScreenHeight(20)),
                AlreadyHaveLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
