import 'package:flutter/material.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/views/home_screen.dart';
import 'package:pgc/views/signin_screen.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/onboard.png"),
              SizedBox(height: MediaQuery.of(context).size.height / 20),
              Text(
                "The Simple Way to find the best! 👌",
                maxLines: 2,
                style: kMainTitleBoldTextStyle.copyWith(
                    fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 20),
              Text(
                "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit",
                maxLines: 2,
                style: kSmallParaTextStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 8),
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      "Next",
                      style: kSmallParaTextStyle.copyWith(
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
