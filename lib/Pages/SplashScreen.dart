import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled8/Pages/HomePage.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: const [
          Text(
            "BAHGA",
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xff0c0a0b)),
          ),
        ],
      ),
      backgroundColor:Color.fromRGBO(243, 173, 37, 1),
      nextScreen: Home(),
      splashIconSize: 250,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
      animationDuration: const Duration(seconds: 1),
    );
  }
}