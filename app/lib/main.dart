import 'package:app/home_screen.dart';
import 'package:app/screen/Sign%20_in.dart';
import 'package:app/screen/introduction/SplashScreen.dart';
import 'package:app/screen/introduction/intropage.dart';
import 'package:app/screen/profiles/profile.dart';
import 'package:app/screen/sign_up.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


String? UserName = '';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Splashscreen(),
        routes: {
          "Sign_In": (context) => const Login(),
          "Sign_up": (context) => const SignUp(),
          "Profile": (context) => const Profile(),
          "onboardsecreen": (context) => const Intropage(),
          "HomePage": (context) => Home()
        });
  }
}
