import 'package:flutter/material.dart';
import 'package:pgc/components/admin_rectangle_card.dart';
import 'package:pgc/components/appointment_rectangle_card.dart';
import 'package:pgc/components/dashboard_card.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/model/appointment_model.dart';
import 'package:pgc/viewmodels/appointment_viewmodel.dart';

class AppointmentDetailStatic extends StatefulWidget {
  const AppointmentDetailStatic({super.key});

  @override
  State<AppointmentDetailStatic> createState() =>
      _AppointmentDetailStaticState();
}

class _AppointmentDetailStaticState extends State<AppointmentDetailStatic> {
  String selectedDate = '';
  List<AppointmentModel> appointments = [];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex:
              1, // Set flex to 1 to make this container take all available vertical space
          child: Align(
            alignment: Alignment.topCenter,
            child: ClipPath(
              clipper: ShapeBorderClipper(
                shape: ContinuousRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
              ),
              child: Container(
                // width: 400,
                padding: EdgeInsets.all(10),
                color: Colors.grey.shade100,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Upcoming Appointments",
                            style: kSubHeadingTextStyle,
                          ),
                          GestureDetector(
                            onTap: () {},
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                      FutureBuilder(
                          future: AppointmentViewModel()
                              .fetchAppointments(selectedDate),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
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
                              appointments =
                                  snapshot.data as List<AppointmentModel>;
                              if (appointments.length == 0) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.search_off_rounded,
                                          size: 40,
                                          color: primaryBlueSoftenCustomColor),
                                      SizedBox(height: 20, width: 20),
                                      Text('No appointments found'),
                                    ],
                                  ),
                                );
                              } else {
                                return ListView.builder(
                                  itemCount: appointments.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             AppointmentDetailScreen(
                                        //                 appointmentModel:
                                        //                     appointments[index])));
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
                                );
                              }
                            }
                          }),
                    ]),
              ),
            ),
          ),
        ),
        SizedBox(width: 10), // Add some space between the two containers
        Expanded(
          flex: 2,
          child: ClipPath(
            clipper: const ShapeBorderClipper(
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
            ),
            child: Container(
              color: Colors.grey.shade100,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 60,
                vertical: MediaQuery.of(context).size.height / 60,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Appointment Detail",
                      style: kSubHeadingTextStyle,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/profile.png"),
                          radius: 60,
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width / 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "data",
                              style: kMainTitleBoldTextStyle,
                            ),
                            Row(
                              children: [
                                Text(
                                  "pet name: ",
                                  style: kSmallParaTextStyle.copyWith(
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "data",
                                  style: kSmallParaTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 60),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                      "data",
                                      style: kSmallParaTextStyle.copyWith(
                                          fontSize: 14),
                                    ),
                                    Text(
                                      "data",
                                      style: kSmallParaTextStyle.copyWith(
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 40),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        primaryBlueCustomColor, // Your desired color
                                    shape: ContinuousRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    // fixedSize: Size.fromHeight(58), // Your desired height
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        style: kSmallParaTextStyle.copyWith(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 40),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        primaryBlueCustomColor, // Your desired color
                                    shape: ContinuousRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    // fixedSize: Size.fromHeight(58), // Your desired height
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        style: kSmallParaTextStyle.copyWith(
                                            color: Colors.white, fontSize: 14),
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
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    Divider(
                      thickness: 1,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 60),
                    Text(
                      "Customer Service",
                      style: kSubHeadingTextStyle,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 80),
                    Text(
                      "Fun and unique grooming styles, such as paw-dicures, temporary pet-safe fur coloring, and custom haircuts.",
                      style: kSmallParaTextStyle.copyWith(fontSize: 12),
                      maxLines: 3,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                    Text(
                      "Customer's past appointment",
                      style: kSubHeadingTextStyle,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 80),
                    AppointmentCard(
                        title: "Luxury Spa",
                        day: "Tuesday",
                        time: "12:00 am",
                        petname: "Bella"),
                    SizedBox(height: MediaQuery.of(context).size.height / 80),
                    AppointmentCard(
                        title: "Luxury Spa",
                        day: "Tuesday",
                        time: "12:00 am",
                        petname: "Bella"),
                    SizedBox(height: MediaQuery.of(context).size.height / 80),
                    AppointmentCard(
                        title: "Luxury Spa",
                        day: "Tuesday",
                        time: "12:00 am",
                        petname: "Bella"),
                    // SizedBox(height: MediaQuery.of(context).size.height / 80),
                    SizedBox(height: MediaQuery.of(context).size.height / 8),
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
                                    borderRadius: BorderRadius.circular(40),
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
                                              color:
                                                  Colors.red.withOpacity(0.3),
                                              width: 2),
                                        ),
                                        shape: MaterialStateProperty.all<
                                            OutlinedBorder>(
                                          ContinuousRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.46),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                      ),
                                      child: Text(
                                        'Cancel',
                                        style: kSubHeadingTextStyle,
                                      ),
                                    ),
                                    OutlinedButton(
                                      onPressed: () async {
                                        // String status =
                                        //     await AppointmentViewModel()
                                        //         .cancelAppointment(
                                        //   widget.appointmentModel,
                                        // );
                                        // if (status == 'success') {
                                        //   Navigator.pop(context);
                                        //   ScaffoldMessenger.of(context)
                                        //       .showSnackBar(
                                        //     SnackBar(
                                        //       content: Text(
                                        //           'Appointment cancelled'),
                                        //     ),
                                        //   );
                                        // } else {
                                        //   ScaffoldMessenger.of(context)
                                        //       .showSnackBar(
                                        //     SnackBar(
                                        //       content: Text(
                                        //           'Error cancelling appointment'),
                                        //     ),
                                        //   );
                                        // }
                                      },
                                      style: ButtonStyle(
                                        side: MaterialStateProperty.all<
                                            BorderSide>(
                                          BorderSide(
                                            color:
                                                Colors.green.withOpacity(0.3),
                                            width: 2,
                                          ),
                                        ),
                                        shape: MaterialStateProperty.all<
                                            OutlinedBorder>(
                                          ContinuousRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.46),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
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
                                  color: Colors.red.withOpacity(0.3), width: 2),
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(15.46),
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
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             AppointmentRescheduleScreen(
                            //                 appointmentModel: widget
                            //                     .appointmentModel)));
                          },
                          style: ButtonStyle(
                            side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(
                                  color: Colors.green.withOpacity(0.3),
                                  width: 2),
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(15.46),
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
                                'Done',
                                style: kSubHeadingTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
