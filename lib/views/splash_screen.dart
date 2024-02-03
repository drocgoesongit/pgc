import 'package:flutter/material.dart';
import 'package:pgc/views/home_screen.dart';
import 'package:pgc/views/onboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    timer();
  }

  Future timer() {
    final time = Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnboardScreen()));
    });
    return time;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(child: Image.asset('assets/images/splash.png')),
      ),
    );
  }
}
