import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:testingapp/screens/login/loginpage.dart';

class animateSplash extends StatelessWidget {
  const animateSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: LottieBuilder.asset("assets/lottie/Animation - 1729352780895.json"),
      nextScreen: const Loginpage(),
      splashIconSize: 300,
      duration: 3000,  // Optional: Set a duration for the splash
      backgroundColor: Colors.white,  // Add background color to avoid a white screen
    );
}
}