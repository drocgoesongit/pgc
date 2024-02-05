import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pgc/admin_views/appointment_detail.dart';
import 'package:pgc/components/admin_rectangle_card.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/const.dart';
import 'package:pgc/constants/helper_class.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/model/appointment_model.dart';
import 'package:pgc/views/all_services_screen.dart';

class AllAppointmentsScreen extends StatefulWidget {
  @override
  _AllAppointmentsScreenState createState() => _AllAppointmentsScreenState();
}

class _AllAppointmentsScreenState extends State<AllAppointmentsScreen> {
  String selectedDate = '';
  List<String> datesList = [];

  List<AppointmentModel> appointments = [];

  Future<List<AppointmentModel>> fetchAppointments(selectedDate) async {
    try {
      if (selectedDate == '') {
        selectedDate = HelperClass.getSameDayDate();
        datesList = HelperClass.generateDateList();

        appointments = [];

        // Fetch appointments for today
        await FirebaseFirestore.instance
            .collection(Constants.fcAppointments)
            .where('apptDate', isEqualTo: selectedDate)
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            log(querySnapshot.docs.toString());
            appointments.add(
                AppointmentModel.fromJson(doc.data() as Map<String, dynamic>));
          });
        });

        return appointments;
      } else {
        log("selected date = $selectedDate  in fetch function");
        appointments = [];
        // Fetch appointments for selected date
        await FirebaseFirestore.instance
            .collection(Constants.fcAppointments)
            .where('apptDate', isEqualTo: selectedDate)
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
      }
    } catch (e) {
      print(e);
      log(e.toString());
      return appointments;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Appointments'),
        ),
        body: FutureBuilder(
          future: fetchAppointments(selectedDate),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData) {
              return Center(
                child: Text('No appointments found'),
              );
            } else {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Date list
                      Text(
                        "Dates",
                        style: kSubHeadingTextStyle,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 70,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: datesList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(
                                  color: softGrayStrokeCustomColor,
                                  width: 2,
                                ),
                              ),
                              child: SizedBox(
                                width: 60,
                                height: 60,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      log("selected date = ${datesList[index]}");
                                      selectedDate = datesList[index];
                                    });
                                  },
                                  child: ClipPath(
                                    clipper: const ShapeBorderClipper(
                                      shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                      ),
                                    ),
                                    child: Container(
                                      color: selectedDate == datesList[index]
                                          ? TealDarkCustomColor
                                          : Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Text(
                                                datesList[index]
                                                    .substring(8, 10),
                                                style: kButtonBigTextStyle.copyWith(
                                                    color: selectedDate ==
                                                            datesList[index]
                                                        ? Colors.white
                                                        : primaryBlueSoftenCustomColor)),
                                            Text(
                                              HelperClass.getMonthAbbreviation(
                                                datesList[index]
                                                    .substring(5, 7),
                                              ),
                                              style: kSmallParaTextStyle.copyWith(
                                                  color: selectedDate ==
                                                          datesList[index]
                                                      ? Colors.white
                                                      : primaryBlueSoftenCustomColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Upcomming Appointments",
                            style: kSubHeadingTextStyle,
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
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
                      SizedBox(height: MediaQuery.of(context).size.height / 60),

                      ListView.builder(
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
                                text: appointments[index]
                                    .apptTime
                                    .substring(0, 2),
                                name: appointments[index].username,
                                service: appointments[index].petName),
                          );
                        },
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height / 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Past Appointments",
                            style: kSubHeadingTextStyle,
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
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
                      SizedBox(height: MediaQuery.of(context).size.height / 60),

                      ListView.builder(
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
                                text: appointments[index]
                                    .apptTime
                                    .substring(0, 2),
                                name: appointments[index].username,
                                service: appointments[index].petName),
                          );
                        },
                      ),
                      // Appointments list
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }
}
