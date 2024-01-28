import 'package:flutter/material.dart';
import 'package:pgc/components/appointment_rectangle_card.dart';
import 'package:pgc/components/review_card.dart';
import 'package:pgc/components/service_square_card.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pgc/views/all_services_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
                height: MediaQuery.of(context).size.height / 2.3,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primaryBlueCustomColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(35.33),
                        bottomRight: Radius.circular(35.33))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/images/filter.png"),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 18,
                            ),
                            Text(
                              "Paws and Claws",
                              style: kSmallParaTextStyle.copyWith(
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        Container(
                          child: Image.asset("assets/images/profile.png"),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.46))),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height / 100,
                    // ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Elevate Your\nPet Style!",
                              style: kMainTitleBoldTextStyle.copyWith(
                                  color: Colors.white),
                            ),
                            Center(
                              child: Container(
                                child:
                                    Image.asset("assets/images/dogflyer.png"),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFF877FFA), // Your desired color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.46),
                              ),
                              // fixedSize: Size.fromHeight(58), // Your desired height
                            ),
                            child: Text(
                              "Book Appointment",
                              style: kSubHeadingTextStyle.copyWith(
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Services",
                    style: kSmallParaTextStyle.copyWith(
                        fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ServicesListScreen()));
                    },
                    child: Row(
                      children: [
                        Text(
                          "View all",
                          style: kSmallParaTextStyle.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Icon(
                          Icons.arrow_forward_outlined,
                          size: 14,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 80,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SquareCard(
                        image: 'assets/images/petgreen.png',
                        text: 'Basic\npackage'),
                    SquareCard(
                        image: 'assets/images/petblack.png',
                        text: 'Basic\npackage'),
                    SquareCard(
                        image: 'assets/images/petyellow.png',
                        text: 'Basic\npackage'),
                    SquareCard(
                        image: 'assets/images/petphoto.png',
                        text: 'Basic\npackage'),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 60,
              ),
              Text(
                "Upcoming appointments",
                style:
                    kSmallParaTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              const AppointmentCard(
                image: 'assets/images/petblue.png',
                title: 'Luxury Spa',
                time: "12:30 am",
                day: "Today",
                petname: "Bella",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 60,
              ),
              Text(
                "Reviews",
                style:
                    kSmallParaTextStyle.copyWith(fontWeight: FontWeight.bold),
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
                style:
                    kSmallParaTextStyle.copyWith(fontWeight: FontWeight.bold),
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
                style:
                    kSmallParaTextStyle.copyWith(fontWeight: FontWeight.bold),
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
            ]),
          ),
        ]),
      ),
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
