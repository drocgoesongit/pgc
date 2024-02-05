import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pgc/admin_views/all_customers_screen.dart';
import 'package:pgc/components/appointment_rectangle_card.dart';
import 'package:pgc/components/dashboard_card.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';
// import 'package:pgc/model/appointment_model.dart';
// import 'package:pgc/viewmodels/appointment_viewmodel.dart';

class CustomerDetailScreen extends StatefulWidget {
  const CustomerDetailScreen({
    super.key,
  });

  @override
  State<CustomerDetailScreen> createState() => CustomerDetailScreenState();
}

class CustomerDetailScreenState extends State<CustomerDetailScreen> {
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
        appBar:
            AppBar(title: Text('Customer detail', style: kSubHeadingTextStyle)),
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
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomerDetailCard(
                                    text: "Phone",
                                    icon: Icons.call_rounded,
                                    num: "+1 1234567890"),
                                CustomerDetailCard(
                                    text: "Mail",
                                    icon: Icons.mail_rounded,
                                    num: "janediop112@gmail.com"),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 40),
                            Text(
                              "Past appointments",
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
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 10),
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
