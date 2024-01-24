import 'package:flutter/material.dart';
import 'package:pgc/constants/text_const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child:
            Center(child: Text("Home Screen", style: kMainTitleBoldTextStyle)),
      ),
    );
  }
}
