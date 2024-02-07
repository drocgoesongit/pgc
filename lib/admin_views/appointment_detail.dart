import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pgc/admin_views/all_customers_screen.dart';
import 'package:pgc/components/appointment_rectangle_card.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/model/appointment_model.dart';
import 'package:pgc/viewmodels/appointment_viewmodel.dart';

class AppointmentDetailScreen extends StatefulWidget {
  const AppointmentDetailScreen({super.key, required this.appointmentModel});
  final AppointmentModel appointmentModel;

  @override
  State<AppointmentDetailScreen> createState() =>
      _AppointmentDetailScreenState();
}

class _AppointmentDetailScreenState extends State<AppointmentDetailScreen> {
  Future<String> getAppointmentDetails() async {
    try {
      return 'success';
    } catch (e) {
      log('Error: e');
      return 'error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Appointment', style: kSubHeadingTextStyle)),
        body: SingleChildScrollView(
          // scrollDirection: Axis.vertical,
          child: Column(children: [
            FutureBuilder(
                future: getAppointmentDetails(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return Container(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width / 20),
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/images/profile.png"),
                                  radius: 60,
                                ),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AllCustomer()));
                                      },
                                      child: Text(
                                        "Jane D.",
                                        style: kMainTitleBoldTextStyle,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "pet name: ",
                                          style: kSmallParaTextStyle.copyWith(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "Bella",
                                          style: kSmallParaTextStyle.copyWith(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                60),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.calendar_month_rounded,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start, // Align texts to the right
                                          children: [
                                            Text(
                                              "Today",
                                              style: kSmallParaTextStyle
                                                  .copyWith(fontSize: 14),
                                            ),
                                            Text(
                                              "12:00 am",
                                              style: kSmallParaTextStyle
                                                  .copyWith(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                40),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            primary:
                                                primaryBlueCustomColor, // Your desired color
                                            shape: ContinuousRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            // fixedSize: Size.fromHeight(58), // Your desired height
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.call_rounded,
                                                color: Colors.white,
                                                size: 15,
                                              ), // Replace "example_icon" with the desired icon
                                              SizedBox(
                                                  width:
                                                      4), // Adjust the spacing between icon and text as needed
                                              Text(
                                                "Call",
                                                style: kSmallParaTextStyle
                                                    .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                40),
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            primary:
                                                primaryBlueCustomColor, // Your desired color
                                            shape: ContinuousRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            // fixedSize: Size.fromHeight(58), // Your desired height
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.info_rounded,
                                                color: Colors.white,
                                                size: 16,
                                              ), // Replace "example_icon" with the desired icon
                                              SizedBox(
                                                  width:
                                                      4), // Adjust the spacing between icon and text as needed
                                              Text(
                                                "info",
                                                style: kSmallParaTextStyle
                                                    .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 20),
                            Divider(
                              thickness: 1,
                              color: Colors.grey.shade300,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 60),
                            Text(
                              "Customer Service",
                              style: kSubHeadingTextStyle,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 80),
                            Text(
                              "Fun and unique grooming styles, such as paw-dicures, temporary pet-safe fur coloring, and custom haircuts.",
                              style: kSmallParaTextStyle.copyWith(fontSize: 12),
                              maxLines: 3,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 40),
                            Text(
                              "Customer's past appointment",
                              style: kSubHeadingTextStyle,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 80),
                            AppointmentCard(
                                image: "assets/images/petblack.png",
                                title: "Luxury Spa",
                                day: "Tuesday",
                                time: "12:00 am",
                                petname: "Bella"),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 80),
                            // Text('Name: ${widget.appointmentModel.userId}'),
                            // Text(
                            //     'Phone: ${widget.appointmentModel.feesStatus}'),
                            // Text('Email: ${widget.appointmentModel.userId}'),
                            // Text('Date: ${widget.appointmentModel.apptDate}'),
                            // Text('Time: ${widget.appointmentModel.apptTime}'),
                            // Text(
                            //     'Service: ${widget.appointmentModel.serviceId}'),
                            // Text(
                            //     'Status: ${widget.appointmentModel.feesStatus}'),
                            // SizedBox(
                            //     height:
                            //         MediaQuery.of(context).size.height / 10),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                OutlinedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          shape: ContinuousRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          surfaceTintColor: Colors.white,
                                          title: Text(
                                            'Cancel Appointment',
                                            style: kMainTitleBoldTextStyle,
                                          ),
                                          content: Text(
                                            'Are you sure you want to cancel the appointment?',
                                            style: kSmallParaTextStyle,
                                          ),
                                          actions: [
                                            OutlinedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              style: ButtonStyle(
                                                side: MaterialStateProperty.all<
                                                    BorderSide>(
                                                  BorderSide(
                                                      color: Colors.red
                                                          .withOpacity(0.3),
                                                      width: 2),
                                                ),
                                                shape: MaterialStateProperty
                                                    .all<OutlinedBorder>(
                                                  ContinuousRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.46),
                                                  ),
                                                ),
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.white),
                                              ),
                                              child: Text(
                                                'Cancel',
                                                style: kSubHeadingTextStyle,
                                              ),
                                            ),
                                            OutlinedButton(
                                              onPressed: () async {
                                                String status =
                                                    await AppointmentViewModel()
                                                        .cancelAppointment(
                                                  widget.appointmentModel,
                                                );
                                                if (status == 'success') {
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          'Appointment cancelled'),
                                                    ),
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          'Error cancelling appointment'),
                                                    ),
                                                  );
                                                }
                                              },
                                              style: ButtonStyle(
                                                side: MaterialStateProperty.all<
                                                    BorderSide>(
                                                  BorderSide(
                                                    color: Colors.green
                                                        .withOpacity(0.3),
                                                    width: 2,
                                                  ),
                                                ),
                                                shape: MaterialStateProperty
                                                    .all<OutlinedBorder>(
                                                  ContinuousRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.46),
                                                  ),
                                                ),
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.white),
                                              ),
                                              child: Text(
                                                'Yes',
                                                style: kSubHeadingTextStyle,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.all<BorderSide>(
                                      BorderSide(
                                          color: Colors.red.withOpacity(0.3),
                                          width: 2),
                                    ),
                                    shape: MaterialStateProperty.all<
                                        OutlinedBorder>(
                                      ContinuousRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.46),
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.disabled_by_default_rounded,
                                        size: 16,
                                        color: Colors.red,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        'Cancel',
                                        style: kSubHeadingTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                OutlinedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.all<BorderSide>(
                                      BorderSide(
                                          color: Colors.green.withOpacity(0.3),
                                          width: 2),
                                    ),
                                    shape: MaterialStateProperty.all<
                                        OutlinedBorder>(
                                      ContinuousRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.46),
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.check_box_rounded,
                                        size: 16,
                                        color: Colors.green,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        'Reschedule',
                                        style: kSubHeadingTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    } else {
                      return Center(child: Text('No Data found'));
                    }
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else {
                    return Center(child: Text('Error'));
                  }
                })
          ]),
        ));
  }
}
