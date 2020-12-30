import 'package:flutter/widgets.dart';
import 'package:managing_home_v004/screens/add_categories/add_categories_screen.dart';
import 'package:managing_home_v004/screens/forget_password/forget_password_screen.dart';
import 'package:managing_home_v004/screens/home/home_screen.dart';
import 'package:managing_home_v004/screens/login/login_screen.dart';
import 'package:managing_home_v004/screens/profile/profile_screen.dart';
import 'package:managing_home_v004/screens/sign_in/sign_in_screen.dart';
import 'package:managing_home_v004/screens/sign_up/sign_up_screen.dart';
import 'package:managing_home_v004/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
  // LoginSuccessScreen.routName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  // CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  // OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  AddCategoriesScreen.routeName: (context) => AddCategoriesScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};

// class AppRoutes {
//   AppRoutes._();

//   static const String authLogin = '/auth-login';
//   static const String authRegister = '/auth-register';
//   static const String menu = '/menu';
//   static const String splashScreen = '/splash-screen';

//   static Map<String, WidgetBuilder> define() {
//     return {
//       authLogin: (context) => LoginScreen(),
//       authRegister: (context) => Register(),
//       menu: (context) => HomeScreen(),
//       splashScreen: (context) => SplashScreen(),
//     };
//   }
// }
