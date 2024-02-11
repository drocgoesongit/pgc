import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 4,
        bottom: MediaQuery.of(context).size.height / 10,
        left: MediaQuery.of(context).size.width / 40,
        right: MediaQuery.of(context).size.width / 40,
      ),
      color: primaryBlueSoftenCustomColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Purrfectly Groomed",
                style: kMainTitleBoldTextStyle.copyWith(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 60),
              Text(
                "No.1 in pet grooming business",
                maxLines: 3,
                textAlign: TextAlign.left,
                style: kSubHeadingTextStyle.copyWith(color: Colors.white),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              const Row(
                children: [
                  Icon(Icons.facebook_rounded),
                  // SvgPicture.asset("assets/images/twitterxblack.svg"),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(Icons.facebook_rounded),
                  // SvgPicture.asset("assets/images/facebook.svg"),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(Icons.facebook_rounded),
                  // SvgPicture.asset("assets/images/instagram.svg"),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(Icons.facebook_rounded),
                  // SvgPicture.asset("assets/images/linkedin.svg"),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Company",
                style: kSubHeadingTextStyle.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w100),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              Text(
                "About us",
                style: kSubHeadingTextStyle.copyWith(color: Colors.white),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 60),
              Text(
                "Contact us",
                style: kSubHeadingTextStyle.copyWith(color: Colors.white),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Company",
                style: kSubHeadingTextStyle.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w100),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              Text(
                "About us",
                style: kSubHeadingTextStyle.copyWith(color: Colors.white),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 60),
              Text(
                "Contact us",
                style: kSubHeadingTextStyle.copyWith(color: Colors.white),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Company",
                style: kSubHeadingTextStyle.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w100),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              Text(
                "About us",
                style: kSubHeadingTextStyle.copyWith(color: Colors.white),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 60),
              Text(
                "Contact us",
                style: kSubHeadingTextStyle.copyWith(color: Colors.white),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Company",
                style: kSubHeadingTextStyle.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w100),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              Text(
                "About us",
                style: kSubHeadingTextStyle.copyWith(color: Colors.white),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 60),
              Text(
                "Contact us",
                style: kSubHeadingTextStyle.copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
