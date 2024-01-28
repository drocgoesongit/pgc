import 'package:flutter/material.dart';
import 'package:pgc/components/service_rectangle_card.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';

class ServicesListScreen extends StatefulWidget {
  const ServicesListScreen({super.key});

  @override
  State<ServicesListScreen> createState() => _ServicesListScreenState();
}

class _ServicesListScreenState extends State<ServicesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: primaryBlueSoftenCustomColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text("All Services", style: kMainTitleBoldTextStyle),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
        child: const Column(
          children: [
            ServiceCard(
                image: "assets/images/petgreen.png",
                title: "Basic Package",
                description: "Bath, brush, nail trim, and ear cleaning"),
            ServiceCard(
                image: "assets/images/petblack.png",
                title: "Basic Package",
                description: "Bath, brush, nail trim, and ear cleaning"),
            ServiceCard(
                image: "assets/images/petyellow.png",
                title: "Basic Package",
                description: "Bath, brush, nail trim, and ear cleaning"),
            ServiceCard(
                image: "assets/images/petphoto.png",
                title: "Basic Package",
                description: "Bath, brush, nail trim, and ear cleaning"),
            ServiceCard(
                image: "assets/images/petgreen.png",
                title: "Basic Package",
                description: "Bath, brush, nail trim, and ear cleaning"),
            ServiceCard(
                image: "assets/images/petgreen.png",
                title: "Basic Package",
                description: "Bath, brush, nail trim, and ear cleaning"),
          ],
        ),
      ),
    );
  }
}
