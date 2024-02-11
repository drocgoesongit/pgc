import 'package:flutter/material.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/web_components/brand_val_container.dart';

class BrandValues extends StatelessWidget {
  const BrandValues({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "WHY CHOOSE US",
            style: kSubHeadingTextStyle.copyWith(
                color: Colors.red, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 60),
          Text(
            "Our brand values",
            maxLines: 2,
            style: kMainTitleBoldTextStyle.copyWith(fontSize: 36),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BrandValcard(
                  image: "assets/images/contact.svg",
                  title: "Passion for pets",
                  subtitle: "We genuinely love and care for all animals",
                  colors: PurpleAccentCustomColor),
              BrandValcard(
                  image: "assets/images/professional.svg",
                  title: "Professionalism",
                  subtitle:
                      "Our skilled groomers prioritize safety, quality, and excellence.",
                  colors: RedAccentCustomColor)
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BrandValcard(
                  image: "assets/images/chat.svg",
                  title: "Customer's Satisfaction",
                  subtitle: "Your pet's happiness is our top priority.",
                  colors: GreenAccentCustomColor),
              BrandValcard(
                  image: "assets/images/innovation.svg",
                  title: "Innovation",
                  subtitle:
                      "We stay updated with the latest grooming techniques and products.",
                  colors: BlackAccentCustomColor)
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 20),
          Divider(
            color: Colors.grey.withOpacity(0.5),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 590,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ready to transform your pet's look?",
                      style: kMainTitleBoldTextStyle.copyWith(fontSize: 32),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 60),
                    Text(
                      "Book your appointment now for exceptional grooming services that bring out the best in your furry friend.",
                      style: kSmallParaTextStyle,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              Container(
                height: 60,
                width: 220,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: primaryBlueCustomColor, // Your desired color
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      // fixedSize: Size.fromHeight(58), // Your desired height
                    ),
                    child: Text(
                      "Book Appointment",
                      style: kButtonBigTextStyle.copyWith(color: Colors.white),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
