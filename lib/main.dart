import 'package:flutter/material.dart';
import 'package:pgc/views/all_services_screen.dart';
import 'package:pgc/views/appointment_screen.dart';
import 'package:pgc/views/dashboard_screen.dart';
import 'package:pgc/views/home_screen.dart';
import 'package:pgc/views/signin_screen.dart';
import 'package:pgc/views/signup_screen.dart';
import 'package:pgc/views/splash_screen.dart';
import 'package:pgc/views/forgot_password_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
