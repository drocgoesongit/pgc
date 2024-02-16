// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pgc/components/single_info_alert_box.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/helper_class.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/model/appointment_model.dart';
import 'package:pgc/model/hour_slot_model.dart';
import 'package:pgc/model/one_hour_model.dart';
import 'package:pgc/viewmodels/appointment_viewmodel.dart';
import 'package:pgc/viewmodels/slots_status_viewmodel.dart';
import 'package:pgc/views/home_screen.dart';
import 'package:pgc/views/sign_in_screen.dart';

class AppointmentRescheduleScreen extends StatefulWidget {
  const AppointmentRescheduleScreen(
      {super.key, required this.appointmentModel});
  final AppointmentModel appointmentModel;
  @override
  State<AppointmentRescheduleScreen> createState() =>
      _AppointmentRescheduleScreenState();
}

class _AppointmentRescheduleScreenState
    extends State<AppointmentRescheduleScreen> {
  String selectedDate = "";
  List<String> datesList = [];
  late OneHourAvaialabilityModel avaialabilityModel;

  Future<OneHourAvaialabilityModel> getDates(String date) async {
    try {
      if (selectedDate == "") {
        datesList = HelperClass.generateFuture20DateList();
        selectedDate = HelperClass.getSameDayDate();
        avaialabilityModel = await SlotsStatusViewModel()
            .getOneHourAvailability(
                widget.appointmentModel.serviceId, selectedDate);
      } else {
        avaialabilityModel = await SlotsStatusViewModel()
            .getOneHourAvailability(
                widget.appointmentModel.serviceId, selectedDate);
      }
      return avaialabilityModel;
    } catch (e) {
      print(e);
      return SlotsStatusViewModel().getEmptyOneHourModel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Reschedule appointment',
          style: kSubHeadingTextStyle,
        )),
        body: SingleChildScrollView(
          child: Column(children: [
            FutureBuilder(
                future: getDates(selectedDate),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width / 20),
                            child: Row(
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
                                    Text(
                                      widget.appointmentModel.username,
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
                                          widget.appointmentModel.petName,
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
                                              widget.appointmentModel.apptDate,
                                              style: kSmallParaTextStyle
                                                  .copyWith(fontSize: 14),
                                            ),
                                            Text(
                                              widget.appointmentModel.apptTime,
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
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey.shade300,
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 60),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width / 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dates",
                                      style: kSubHeadingTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 70,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: datesList.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        shape: ContinuousRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
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
                                                shape:
                                                    ContinuousRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(30)),
                                                ),
                                              ),
                                              child: Container(
                                                color: selectedDate ==
                                                        datesList[index]
                                                    ? TealDarkCustomColor
                                                    : Colors.white,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                          datesList[index]
                                                              .substring(8, 10),
                                                          style: kButtonBigTextStyle.copyWith(
                                                              color: selectedDate ==
                                                                      datesList[
                                                                          index]
                                                                  ? Colors.white
                                                                  : primaryBlueSoftenCustomColor)),
                                                      Text(
                                                        HelperClass
                                                            .getMonthAbbreviation(
                                                          datesList[index]
                                                              .substring(5, 7),
                                                        ),
                                                        style: kSmallParaTextStyle.copyWith(
                                                            color: selectedDate ==
                                                                    datesList[
                                                                        index]
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
                                    }),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width / 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 16.0),
                                Text(
                                  "Select Time",
                                  style: kSubHeadingTextStyle,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                GridView.count(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  crossAxisCount: 4,
                                  childAspectRatio: 2,
                                  crossAxisSpacing: 4,
                                  mainAxisSpacing: 4,
                                  children: List.generate(24, (index) {
                                    SingleSlotModel singleSlotModel =
                                        HelperClass().getHourModel(
                                            avaialabilityModel, index);
                                    bool isSlotAvailable = singleSlotModel
                                            .availabilityStatus.length <
                                        3;

                                    return GestureDetector(
                                      onTap: () async {
                                        if (isSlotAvailable) {
                                          if (FirebaseAuth
                                                  .instance.currentUser !=
                                              null) {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  shape:
                                                      ContinuousRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                  ),
                                                  surfaceTintColor:
                                                      Colors.transparent,
                                                  title: Text(
                                                      "Are you sure you want to reschedule to this slot?",
                                                      style:
                                                          kSubHeadingTextStyle),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () async {
                                                        log("User is logged in.");
                                                        log("booking for date: $selectedDate, time: ${singleSlotModel.hour}");

                                                        String result =
                                                            await AppointmentViewModel()
                                                                .rescheduleAppointment(
                                                          widget
                                                              .appointmentModel,
                                                          selectedDate,
                                                          singleSlotModel.hour,
                                                        );

                                                        if (result ==
                                                            "success") {
                                                          Navigator.pop(
                                                              context); // Dismiss the current dialog
                                                          showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return AlertDialog(
                                                                shape:
                                                                    ContinuousRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              40),
                                                                ),
                                                                surfaceTintColor:
                                                                    Colors
                                                                        .transparent,
                                                                title: Text(
                                                                    "Appointment Rescheduled successfully.",
                                                                    style:
                                                                        kSubHeadingTextStyle),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context); // Dismiss the success dialog
                                                                      Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              const HomeScreen(),
                                                                        ),
                                                                      );
                                                                    },
                                                                    child: Text(
                                                                      "Done",
                                                                      style: kSubHeadingTextStyle
                                                                          .copyWith(
                                                                        color: const Color(
                                                                            0xFF877FFA),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        } else {
                                                          Navigator.pop(
                                                              context); // Dismiss the current dialog
                                                          showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return AlertDialog(
                                                                shape:
                                                                    ContinuousRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              40),
                                                                ),
                                                                surfaceTintColor:
                                                                    Colors
                                                                        .transparent,
                                                                title: Text(
                                                                    "Error in booking",
                                                                    style:
                                                                        kSubHeadingTextStyle),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context); // Dismiss the error dialog
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                            "OK"),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        }
                                                      },
                                                      child: Text(
                                                        "OK",
                                                        style:
                                                            kSubHeadingTextStyle
                                                                .copyWith(
                                                          color: const Color(
                                                              0xFF877FFA),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          } else {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  shape:
                                                      ContinuousRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                  ),
                                                  surfaceTintColor:
                                                      Colors.transparent,
                                                  title: Text(
                                                      "Please login to book",
                                                      style:
                                                          kSubHeadingTextStyle),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(
                                                            context); // Dismiss the dialog
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const SigninScreen()),
                                                        ); // Navigate to the SigninScreen
                                                      },
                                                      child: Text(
                                                        "OK",
                                                        style:
                                                            kSubHeadingTextStyle
                                                                .copyWith(
                                                          color: const Color(
                                                              0xFF877FFA),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        } else {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                shape:
                                                    ContinuousRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                ),
                                                surfaceTintColor:
                                                    Colors.transparent,
                                                title: Text(
                                                  "Slot is not available",
                                                  style: kSubHeadingTextStyle,
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(
                                                          context); // Dismiss the dialog
                                                    },
                                                    child: Text(
                                                      "OK",
                                                      style:
                                                          kSubHeadingTextStyle
                                                              .copyWith(
                                                        color: const Color(
                                                            0xFF877FFA),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      },
                                      child: ClipPath(
                                        clipper: const ShapeBorderClipper(
                                          shape: ContinuousRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30)),
                                          ),
                                        ),
                                        child: Container(
                                          width: 75,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            // borderRadius: BorderRadius.circular(15.46),
                                            border: Border.all(
                                              color: isSlotAvailable
                                                  ? TealLightCustomColor
                                                  : Colors.redAccent,
                                              width: 2,
                                            ),
                                            color: isSlotAvailable
                                                ? TealLightCustomColor
                                                : Colors.redAccent,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                singleSlotModel.hour,
                                                style: kSmallParaTextStyle
                                                    .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: isSlotAvailable
                                                      ? Colors.black
                                                      : Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                                const SizedBox(height: 16.0),
                                Container(
                                  height: 50,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(
                                          0xFF877FFA), // Your desired color
                                      shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      // fixedSize: Size.fromHeight(58), // Your desired height
                                    ),
                                    child: Text(
                                      "Reschedule",
                                      style: kButtonBigTextStyle.copyWith(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Center(child: Text('No Data found'));
                    }
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else {
                    return const Center(child: Text('Error'));
                  }
                })
          ]),
        ));
  }
}
