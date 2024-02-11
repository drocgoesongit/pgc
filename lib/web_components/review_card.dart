import 'package:flutter/material.dart';
import 'package:pgc/constants/text_const.dart';

class WebReviewCard extends StatelessWidget {
  final String profileImagePath;
  final int starRating;
  final String reviewText;
  final String uname;
  final String udesg;

  const WebReviewCard({
    Key? key,
    required this.profileImagePath,
    required this.starRating,
    required this.reviewText,
    required this.uname,
    required this.udesg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2, // Add elevation if desired
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.46),
      ),
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // alignment: Alignment.topLeft,
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(profileImagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width / 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < starRating ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height /
                          20), // Adjust the spacing as needed
                  // Review text below the stars
                  Text(
                    reviewText,
                    style: kMainTitleBoldTextStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines:
                        3, // Limit the number of lines to prevent overflow
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),
                  Row(
                    children: [
                      Text(
                        uname,
                        style: kSmallParaTextStyle.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width / 40),
                      Text(
                        udesg,
                        style: kSmallParaTextStyle.copyWith(),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageTextContainer extends StatelessWidget {
  final String imagePath;
  final String text;
  final String smalltext;

  const ImageTextContainer({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.smalltext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: 160,
        // padding: EdgeInsets.all(16.0),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(8.0),
        // ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image at the top-left corner
            Container(
              width: 30,
              height: 30,
              // margin: EdgeInsets.only(right: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 26,
            ),
            // Text adjacent to the image
            Expanded(
              child: Column(
                children: [
                  Text(
                    text,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: kSmallParaTextStyle.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    smalltext,
                    style: kSmallParaTextStyle.copyWith(fontSize: 12),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
