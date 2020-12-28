import 'package:flutter/material.dart';
import 'package:managing_home_v004/screens/splash/components/body.dart';
import 'package:managing_home_v004/size_config.dart';

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
