import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:managing_home_v004/routes.dart';
import 'package:managing_home_v004/screens/home/home_screen.dart';
import 'package:managing_home_v004/screens/sign_in/components/authentication_service.dart';
import 'package:managing_home_v004/screens/sign_in/sign_in_screen.dart';
import 'package:managing_home_v004/screens/splash/splash_screen.dart';
import 'package:managing_home_v004/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Managing Home',
        theme: theme(),
        routes: routes,
        // home: SplashScreen(),
        initialRoute: SplashScreen.routeName,
        // home: AuthenticationWrapper(),
      ),
    );
  }
}

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
