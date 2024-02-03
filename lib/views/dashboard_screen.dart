import 'package:flutter/material.dart';
import 'package:pgc/components/appointment_rectangle_card.dart';
import 'package:pgc/components/dashboard_card.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

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
          child: Text("Dashboard", style: kMainTitleBoldTextStyle),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const DashboardCard(
                    text: "Appointments remaining",
                    icon: Icons.calendar_month_rounded,
                    num: "20"),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 60,
                ),
                const DashboardCard(
                    text: "Today's Appointment",
                    icon: Icons.description_rounded,
                    num: "12"),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 60,
                ),
                const DashboardCard(
                    text: "Today's Revenue",
                    icon: Icons.insert_chart_rounded,
                    num: "\$12,546"),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Chats",
                  style:
                      kSmallParaTextStyle.copyWith(fontWeight: FontWeight.w600),
                ),
                Row(
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
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 80,
            ),
            RecentChat(
                image: "assets/images/profile.png",
                id: "Jane D.",
                chat: "Hi Jenny",
                timestamp: "12.00 AM"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 60,
            ),
            RecentChat(
                image: "assets/images/profile.png",
                id: "Jane D.",
                chat: "Hi Jenny",
                timestamp: "12.00 AM"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 60,
            ),
            RecentChat(
                image: "assets/images/profile.png",
                id: "Jane D.",
                chat: "Hi Jenny",
                timestamp: "12.00 AM"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Upcoming appointments",
                  style:
                      kSmallParaTextStyle.copyWith(fontWeight: FontWeight.w600),
                ),
                Row(
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
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 60,
            ),
            AppointmentCard(
                image: "assets/images/petblack.png",
                title: "Luxury Spa ",
                day: "Today",
                time: "12:30 am",
                petname: "Bella"),
            AppointmentCard(
                image: "assets/images/petblack.png",
                title: "Luxury Spa ",
                day: "Today",
                time: "12:30 am",
                petname: "Bella"),
            AppointmentCard(
                image: "assets/images/petblack.png",
                title: "Luxury Spa ",
                day: "Today",
                time: "12:30 am",
                petname: "Bella"),
          ],
        ),
      ),
    );
  }
}
