import 'package:app/screen/introduction/intropage.dart';
import 'package:firstsplashscreenview/firstsplashscreenview.dart';
import 'package:flutter/material.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        backgroundColor: Colors.red,
        duration: const Duration(milliseconds: 3000),
        nextPage: const Intropage(),
        iconBackgroundColor: Colors.white,
        circleHeight: 100,
        child: Container(child: Image.asset("images/logo.png",)),
          
        text: const Text(
          "MONTITY",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
    );
  }
}

