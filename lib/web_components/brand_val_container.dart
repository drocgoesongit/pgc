import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';

class BrandValcard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final Color colors;
  const BrandValcard(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.colors});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: colors,
            ),
            // Your desired custom color
            child: Center(
              child: SvgPicture.asset(
                image,
                // width: 40, // Adjust width as needed
                // height: 40, // Adjust height as needed
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 80,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: kMainTitleBoldTextStyle.copyWith(fontSize: 20),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 60,
                ),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: kSmallParaTextStyle.copyWith(fontSize: 20),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
