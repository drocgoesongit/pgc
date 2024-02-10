import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pgc/admin_views/all_appointments_screen.dart';
import 'package:pgc/admin_views/all_customers_screen.dart';
import 'package:pgc/admin_views/appointment_detail.dart';
import 'package:pgc/components/admin_rectangle_card.dart';
import 'package:pgc/components/dashboard_card.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/const.dart';
import 'package:pgc/constants/helper_class.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/model/appointment_model.dart';
import 'package:pgc/model/chat_model.dart';
import 'package:pgc/viewmodels/analytics_viewmodel.dart';
import 'package:pgc/viewmodels/appointment_viewmodel.dart';
import 'package:pgc/views/chat_screen.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  int appointmentRemaining = 0;
  int todayAppointment = 0;
  int totalNumberOfCustomers = 0;
  List<AppointmentModel> appointments = [];
  List<ChatModel> chats = [];

  Future<String> getAnalyticsData() async {
    try {
      appointmentRemaining =
          await AnalyticsViewModel().getRemainingTodaysAppointment();
      todayAppointment =
          await AnalyticsViewModel().getNumberOfAppointmentsForToday();
      totalNumberOfCustomers = await AnalyticsViewModel().getNumberOfUsers();
      return "success";
    } catch (e) {
      log(e.toString());
      return "error";
    }
  }

  Future<List<AppointmentModel>> getUpcomingAppointments() async {
    try {
      // Fetch appointments for today
      await FirebaseFirestore.instance
          .collection(Constants.fcAppointments)
          .where('apptDate', isEqualTo: HelperClass.getSameDayDate())
          .where('apptStatus', isEqualTo: Constants.appointmentActive)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          log(querySnapshot.docs.toString());
          appointments.add(
              AppointmentModel.fromJson(doc.data() as Map<String, dynamic>));
        });
      });
      return appointments;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<List<ChatModel>> getRecentChats() async {
    try {
      // Fetch appointments for today
      await FirebaseFirestore.instance
          .collection(Constants.fcChatNode)
          .orderBy(Constants.fcTimeStampChatNode, descending: true)
          .limit(3)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          log(querySnapshot.docs.toString());
          chats.add(ChatModel.fromMap(doc.data() as Map<String, dynamic>));
        });
      });
      return chats;
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
        actions: [
          IconButton(
            icon: Icon(
              Icons.history_rounded,
              color: primaryBlueSoftenCustomColor,
            ),
            onPressed: () async {
              await AppointmentViewModel().setPastAppointmentToDone();
            },
          ),
        ],
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllCustomer(
                                        numberOfTotalCustomers:
                                            totalNumberOfCustomers,
                                        numberOfAppointmentsRemaining:
                                            appointmentRemaining,
                                        numberOfTodaysAppointments:
                                            todayAppointment,
                                      )));
                        },
                        child: DashboardCard(
                          icon: Icons.person,
                          text: "Total Number of Customers",
                          value: totalNumberOfCustomers.toString(),
                        ),
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
            FutureBuilder(
                future: getRecentChats(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return ListView.builder(
                      itemCount: chats.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AppointmentDetailScreen(
                                              appointmentModel:
                                                  appointments[index])));
                            },
                            child: RecentChat(
                                image: "",
                                id: chats[index].chatId,
                                chat: chats[index].lastMessage,
                                timestamp: HelperClass.formatTimestampToAmPm(
                                    chats[index].lastMessageTimestamp)));
                      },
                    );
                  }
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height / 80,
            ),
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
            FutureBuilder(
                future: getUpcomingAppointments(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return ListView.builder(
                      itemCount: appointments.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AppointmentDetailScreen(
                                            appointmentModel:
                                                appointments[index])));
                          },
                          child: AdminCard(
                              time: appointments[index].apptTime,
                              text:
                                  appointments[index].apptTime.substring(0, 2),
                              name: appointments[index].username,
                              service: appointments[index].petName),
                        );
                      },
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
