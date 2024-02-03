import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pgc/admin_views/appointment_detail.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/const.dart';
import 'package:pgc/constants/helper_class.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/model/appointment_model.dart';

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
              return Column(
                children: [
                  // Date list
                  Text(
                    "Dates",
                    style: kSubHeadingTextStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: datesList.length,
                      itemBuilder: (context, index) {
                        return ClipPath(
                          clipper: ShapeBorderClipper(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Container(
                            width: 80,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  log("selected date = ${datesList[index]}");
                                  selectedDate = datesList[index];
                                });
                              },
                              child: Container(
                                color: selectedDate == datesList[index]
                                    ? primaryBlueSoftenCustomColor
                                    : Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(datesList[index].substring(8, 10),
                                          style: kButtonBigTextStyle.copyWith(
                                              color: selectedDate ==
                                                      datesList[index]
                                                  ? Colors.white
                                                  : primaryBlueSoftenCustomColor)),
                                      Text(
                                        HelperClass.getMonthAbbreviation(
                                          datesList[index].substring(5, 7),
                                        ),
                                        style: kSmallParaTextStyle.copyWith(
                                            color:
                                                selectedDate == datesList[index]
                                                    ? Colors.white
                                                    : Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  ListView.builder(
                    itemCount: appointments.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AppointmentDetailScreen(
                                      appointmentModel: appointments[index])));
                        },
                        leading: CircleAvatar(
                          child: Text(
                              appointments[index].apptTime.substring(0, 2)),
                        ),
                        title: Text(appointments[index].apptDate),
                        trailing: Text(appointments[index].apptTime),
                        subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(appointments[index].petName),
                              Text(appointments[index].username),
                              Text(appointments[index].apptStatus)
                            ]),
                      );
                    },
                  )
                  // Appointments list
                ],
              );
            }
          },
        ));
  }
}
