import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:laser_slides/views/home.dart';
import 'package:laser_slides/views/on_boarding.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: 'assets/appIcon.jpg',
        nextScreen: OnBoarding(),
        splashTransition: SplashTransition.fadeTransition,
        duration: 1000,
        splashIconSize: 200,
        curve: Curves.easeOut,
        
        
      )
    );
  }
}