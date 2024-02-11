import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';

class Testimonial extends StatelessWidget {
  const Testimonial({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 40,
          horizontal: MediaQuery.of(context).size.width / 4),
      color: primaryBlueCustomColor,
      child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "TESTIMONIAL",
              style: kSubHeadingTextStyle.copyWith(
                  color: TealLightCustomColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 60),
            Text(
              "\"I've tried several groomers, and this is by far the best. They really pay attention to detail and make my cat feel at ease.\"",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: kMainTitleBoldTextStyle.copyWith(
                  fontSize: 36, color: Colors.white),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 40),
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile.png"),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 60),
            Text(
              "Ian Klien",
              style: kSubHeadingTextStyle.copyWith(color: Colors.white),
            ),
            Text(
              "Regular customer",
              style: kSubHeadingTextStyle.copyWith(
                  color: Colors.white, fontWeight: FontWeight.w100),
            ),
          ],
        ),
      ),
    );
  }
}
