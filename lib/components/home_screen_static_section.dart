import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pgc/components/review_card.dart';
import 'package:pgc/constants/text_const.dart';

class StaticSectionHomeScreen extends StatelessWidget {
  const StaticSectionHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Reviews",
          style: kSubHeadingTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 60,
        ),
        const ReviewCard(
          profileImagePath: 'assets/images/profile.png',
          starRating: 4,
          reviewText: 'This is a great product. I highly recommend it!',
          uname: "Jane D.",
          udesg: "Regular Customer",
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 40,
        ),
        Text(
          "Brand values",
          style: kSubHeadingTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 60,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ImageTextContainer(
              imagePath: 'assets/images/brandval1.png',
              text: 'Passion for pets',
              smalltext: "We genuinly love and care for animals.",
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 10,
            ),
            const ImageTextContainer(
              imagePath: 'assets/images/brandval2.png',
              text: 'Proffesionalism',
              smalltext:
                  "Our skilled groomers prioritize safety,quality,and excellence",
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 60,
        ),
        Text(
          "Gallery",
          style: kSubHeadingTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 60,
        ),
        StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 3,
              child: imageContainer('assets/images/image1.png'),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: imageContainer('assets/images/image2.png'),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 4,
              child: imageContainer('assets/images/image3.png'),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: imageContainer('assets/images/image4.png'),
            ),
          ],
        )
      ],
    );
  }

  imageContainer(imgPath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.46),
      child: Image.asset(
        imgPath,
        fit: BoxFit.cover,
      ),
    );
  }
}
