import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled8/Pages/HomePage.dart';
import 'package:untitled8/Pages/LoginScreen.dart';

class SplashScreen extends StatelessWidget {
  String title ;
  StatefulWidget classroute ;
  SplashScreen(this.title , this.classroute) ;
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children:  [
          Text(
            title ,
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xff0c0a0b)),
          ),
        ],
      ),
      backgroundColor:Color.fromRGBO(243, 173, 37, 1),
      nextScreen: classroute,
      splashIconSize: 250,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
      animationDuration: const Duration(seconds: 1),
    );
  }
}