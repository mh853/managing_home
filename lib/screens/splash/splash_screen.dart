import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:managing_home_v004/screens/home/home_screen.dart';
import 'package:managing_home_v004/screens/sign_in/sign_in_screen.dart';
import 'package:managing_home_v004/screens/splash/components/body.dart';
import 'package:managing_home_v004/size_config.dart';

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return HomeScreen();
    }
    return SignInScreen();
  }
}

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash-screen";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
