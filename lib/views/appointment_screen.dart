import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pgc/components/schedule_card.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

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
          child: Text("Appointment", style: kMainTitleBoldTextStyle),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: [
                Container(
                  // margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/image2.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                ),
                Container(
                  // margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/image2.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                ),
                Container(
                  // margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/image4.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                ),
              ],
              options: CarouselOptions(
                enableInfiniteScroll: false,
                viewportFraction: 1,
                autoPlay: true,
                aspectRatio: 16 / 10,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Creative Styling",
                  style: kMainTitleBoldTextStyle.copyWith(
                    color: Colors.black,
                  ),
                ),
                Text(
                  "\$30",
                  style: kMainTitleBoldTextStyle.copyWith(
                    color: Colors.black,
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Text(
              "About service",
              style: kSmallParaTextStyle.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 80,
            ),
            Text(
              "Fun and unique grooming styles, such as paw-dicures, temporary pet-safe fur coloring, and custom haircuts.",
              style: kSmallParaTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Schedules",
                  style:
                      kSmallParaTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      "August",
                      style: kSmallParaTextStyle.copyWith(fontSize: 12),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 12,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ScheduleCard(title: "7", subtitle: "Sun"),
                ScheduleCard(title: "8", subtitle: "Mon"),
                ScheduleCard(title: "9", subtitle: "Tue"),
                ScheduleCard(title: "10", subtitle: "Wed"),
                ScheduleCard(title: "11", subtitle: "Thu"),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Text(
              "Visit Hours",
              style: kSmallParaTextStyle.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VisitHours(date: "12:00", abr: "PM"),
                VisitHours(date: "12:00", abr: "PM"),
                VisitHours(date: "12:00", abr: "PM"),
                VisitHours(date: "12:00", abr: "PM"),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VisitHours(date: "12:00", abr: "PM"),
                VisitHours(date: "11:00", abr: "AM"),
                VisitHours(date: "09:00", abr: "PM"),
                VisitHours(date: "10:00", abr: "AM"),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VisitHours(date: "02:00", abr: "PM"),
                VisitHours(date: "08:00", abr: "AM"),
                VisitHours(date: "05:00", abr: "PM"),
                VisitHours(date: "03:00", abr: "PM"),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 60,
            ),
            Row(
              children: [
                Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 0.5,
                          ),
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Booked",
                      style: kSmallParaTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  width: 8,
                ),
                Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 0.5,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Available",
                      style: kSmallParaTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  width: 8,
                ),
                Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 0.5,
                          ),
                          color: primaryBlueCustomColor,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Selected",
                      style: kSmallParaTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: primaryBlueCustomColor, // Your desired color
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: primaryBlueCustomColor),
                    borderRadius: BorderRadius.circular(15.46),
                  ),
                  // fixedSize: Size.fromHeight(58), // Your desired height
                ),
                child: Text(
                  "Confirm Booking",
                  style: kSubHeadingTextStyle.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
