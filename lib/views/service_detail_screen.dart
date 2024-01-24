import 'package:flutter/material.dart';
import 'package:pgc/constants/text_const.dart';

class ServicesDetailScreen extends StatefulWidget {
  const ServicesDetailScreen({super.key});

  @override
  State<ServicesDetailScreen> createState() => _ServicesDetailScreenState();
}

class _ServicesDetailScreenState extends State<ServicesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child:
              Text("Services Detail Screen", style: kMainTitleBoldTextStyle)),
    );
  }
}
