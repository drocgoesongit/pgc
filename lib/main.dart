import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pgc/admin_views/all_appointments_screen.dart';
import 'package:pgc/admin_views/all_customers_screen.dart';
import 'package:pgc/admin_views/appointment_detail.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/firebase_options.dart';
import 'package:pgc/views/all_services_screen.dart';
import 'package:pgc/views/dashboard_screen.dart';
import 'package:pgc/views/home_screen.dart';
import 'package:pgc/views/service_detail_screen.dart';
import 'package:pgc/views/signin_screen.dart';
import 'package:pgc/views/signup_screen.dart';
import 'package:pgc/views/splash_screen.dart';
import 'package:pgc/views/forgot_password_screen.dart';
import 'package:pgc/web_views/web_appointment_screen.dart';
import 'package:pgc/web_views/web_chat_screen.dart';
import 'package:pgc/web_views/web_dashboard_screen.dart';
import 'package:pgc/web_views/web_landing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryBlueCustomColor),
        useMaterial3: true,
      ),
      home: WebDashboard(),
    );
  }
}
