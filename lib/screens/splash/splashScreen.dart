import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:testingapp/screens/login/loginpage.dart';
import 'package:testingapp/screens/posts/post_screen.dart';

class animateSplash extends StatefulWidget {
  animateSplash({super.key});

  @override
  State<animateSplash> createState() => _animateSplashState();
}

class _animateSplashState extends State<animateSplash> {
  final auth = FirebaseAuth.instance;

  

  @override
  Widget build(BuildContext context) {
    final user = auth.currentUser;
    if (user!= null) {
       return AnimatedSplashScreen(
      splash: LottieBuilder.asset("assets/lottie/Animation - 1729352780895.json"),
      nextScreen: const PostScreen(),
      splashIconSize: 300,
      duration: 3000,  // Optional: Set a duration for the splash
      backgroundColor: Colors.white,  // Add background color to avoid a white screen
    );
    }else{
       return AnimatedSplashScreen(
      splash: LottieBuilder.asset("assets/lottie/Animation - 1729352780895.json"),
      nextScreen: const Loginpage(),
      splashIconSize: 300,
      duration: 3000,  // Optional: Set a duration for the splash
      backgroundColor: Colors.white,  // Add background color to avoid a white screen
    );
    }
   
}
}