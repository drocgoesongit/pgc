import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pgc/admin_views/all_appointments_screen.dart';
import 'package:pgc/components/appointment_rectangle_card.dart';
import 'package:pgc/components/dashboard_card.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/model/appointment_model.dart';
import 'package:pgc/viewmodels/analytics_viewmodel.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  int appointmentRemaining = 0;
  int todayAppointment = 0;
  int totalNumberOfCustomers = 0;

  Future<String> getAnalyticsData() async {
    try {
      // appointmentRemaining =
      // await AnalyticsViewModel().getRemainingTodaysAppointment();
      todayAppointment = await AnalyticsViewModel().getNumberOfAppointments();
      totalNumberOfCustomers = await AnalyticsViewModel().getNumberOfUsers();
      return "success";
    } catch (e) {
      log(e.toString());
      return "error";
    }
  }

  Future<List<AppointmentModel>> getUpcomingAppointments() async {
    try {
      List<AppointmentModel> appointments = [];
      await Future.delayed(Duration(seconds: 2));
      return appointments;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

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
            FutureBuilder(
              future: getAnalyticsData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData && snapshot.data == "success") {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DashboardCard(
                        icon: Icons.calendar_today_rounded,
                        text: "Appointments Remaining",
                        value: appointmentRemaining.toString(),
                      ),
                      DashboardCard(
                        icon: Icons.calendar_today_rounded,
                        text: "Today's Appointments",
                        value: todayAppointment.toString(),
                      ),
                      DashboardCard(
                        icon: Icons.person,
                        text: "Total Number of Customers",
                        value: totalNumberOfCustomers.toString(),
                      ),
                    ],
                  );
                } else if (snapshot.hasData && snapshot.data == "error") {
                  return const Center(child: Text("Error while fetching data"));
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return const Center(child: Text("Error while fetching data"));
                }
              },
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AllAppointmentsScreen()));
                      },
                      child: Text(
                        "View all",
                        style: kSmallParaTextStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
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
