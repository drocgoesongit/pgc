import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pgc/components/review_card.dart';
import 'package:pgc/components/service_square_card.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/web_components/brand_values_static.dart';
import 'package:pgc/web_components/footer.dart';
import 'package:pgc/web_components/our_customer.dart';
import 'package:pgc/web_components/review_card.dart';
import 'package:pgc/web_components/service_square_card.dart';
import 'package:pgc/web_components/testimonial.dart';
import 'package:pgc/web_components/usp.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Purrfectly Groomed",
              style: kMainTitleBoldTextStyle.copyWith(
                  color: primaryBlueCustomColor),
            ),
            Row(
              children: [
                Text(
                  "Demo",
                  style: kSubHeadingTextStyle,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text("Reviews", style: kSubHeadingTextStyle),
                const SizedBox(
                  width: 12,
                ),
                Text("Values", style: kSubHeadingTextStyle),
                const SizedBox(
                  width: 12,
                ),
                Text("Contact", style: kSubHeadingTextStyle),
              ],
            ),
            Container(
              height: 50,
              width: 209,
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
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "PET CARE SIMPLIFIED",
                                style: kSubHeadingTextStyle.copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 60),
                              Text(
                                "Where Pampering\nMeets Perfection",
                                style: kMainTitleBoldTextStyle.copyWith(
                                    fontSize: 60),
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 60),
                              Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud\nexercitation ullamco laboris nisi.",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: kSubHeadingTextStyle),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 40),
                              SizedBox(
                                height: 50,
                                width: 209,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                          primaryBlueCustomColor, // Your desired color
                                      shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      // fixedSize: Size.fromHeight(58), // Your desired height
                                    ),
                                    child: Text(
                                      "Book Appointment",
                                      style: kButtonBigTextStyle.copyWith(
                                          color: Colors.white),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 460,
                          width: 460,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                230), // Half of the width or height
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                230), // Half of the width or height
                            child: Image.asset(
                              "assets/images/webhero.png",
                              fit: BoxFit
                                  .cover, // Adjust the image's aspect ratio to cover the entire container
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 6),
                  Center(
                    child: Expanded(
                      child: Column(
                        children: [
                          Text(
                            "OUR SERVICES",
                            style: kSubHeadingTextStyle.copyWith(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 60),
                          Text(
                            "We provide great services for our\ncustomers based on their needs",
                            maxLines: 2,
                            style:
                                kMainTitleBoldTextStyle.copyWith(fontSize: 36),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 10),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              WebServiceSquareCard(
                                color: Colors.greenAccent,
                                image: "assets/images/petgreen.png",
                                text:
                                    "bath, bursh, nails, trim, nail and blah balbh balh",
                                service: 'Basic package',
                              ),
                              WebServiceSquareCard(
                                color: Colors.blueAccent,
                                image: "assets/images/petblue.png",
                                text:
                                    "bath, bursh, nails, trim, nail and blah balbh balh",
                                service: 'Basic package',
                              ),
                              WebServiceSquareCard(
                                color: Colors.redAccent,
                                image: "assets/images/petphoto.png",
                                text:
                                    "bath, bursh, nails, trim, nail and blah balbh balh",
                                service: 'Basic package',
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  const WebReviewCard(
                      profileImagePath: "assets/images/profile.png",
                      starRating: 4,
                      reviewText:
                          "Although the wait time at this dentist’s office was longer than anticipated, the exceptional quality of care more than compensated for it. The staff exhibited friendliness, expertise, and ensured my comfort throughout the entire visit.",
                      uname: "Jane D.",
                      udesg: "Web Dev"),
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "OUR STORY",
                        style: kSubHeadingTextStyle.copyWith(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 60),
                      Container(
                        width: 500,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "At ",
                                style: kMainTitleBoldTextStyle,
                              ),
                              TextSpan(
                                text: "Purrfectly Groomed",
                                style: kMainTitleBoldTextStyle.copyWith(
                                    color: primaryBlueCustomColor),
                              ),
                              TextSpan(
                                text:
                                    ", we are dedicated to enhancing the well-being of your pets through expert grooming services.",
                                style: kMainTitleBoldTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 40),
                      StaggeredGrid.count(
                        crossAxisCount: 6,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
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
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 1,
                            child: imageContainer('assets/images/image5.png'),
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 20),
                      const Usp(),
                      SizedBox(height: MediaQuery.of(context).size.height / 10),
                      const BrandValues(),
                      SizedBox(height: MediaQuery.of(context).size.height / 8),
                      const OurCustomer(),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 8),
            const Testimonial(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

imageContainer(imgPath) {
  return ClipPath(
    clipper: ShapeBorderClipper(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    child: Image.asset(
      imgPath,
      fit: BoxFit.cover,
    ),
  );
}
