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
        datesList = HelperClass.generateDateList();
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
        appBar: AppBar(title: Text('Reschedule appointment')),
        body: SingleChildScrollView(
          child: Column(children: [
            FutureBuilder(
                future: getDates(selectedDate),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Container(
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
                                            color:
                                                selectedDate == datesList[index]
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
                                                      style: kButtonBigTextStyle
                                                          .copyWith(
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
                                                    style: kSmallParaTextStyle
                                                        .copyWith(
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
                          SizedBox(height: 20),
                          GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 4,
                            childAspectRatio: 2,
                            children: List.generate(24, (index) {
                              SingleSlotModel singleSlotModel = HelperClass()
                                  .getHourModel(avaialabilityModel, index);
                              bool isSlotAvailable =
                                  singleSlotModel.availabilityStatus.length < 3;

                              return GestureDetector(
                                onTap: () async {
                                  if (isSlotAvailable) {
                                    if (FirebaseAuth.instance.currentUser !=
                                        null) {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return SingleInfoAlertBox(
                                              text:
                                                  "Are you sure you want to reschedule to this slot?",
                                              onOkPressed: () async {
                                                log("User is logged in.");
                                                log("booking for date: $selectedDate, time: ${singleSlotModel.hour}");

                                                String result =
                                                    await AppointmentViewModel()
                                                        .rescheduleAppointment(
                                                  widget.appointmentModel,
                                                  selectedDate,
                                                  singleSlotModel.hour,
                                                );

                                                if (result == "success") {
                                                  // ignore: use_build_context_synchronously
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return SingleInfoAlertBox(
                                                          text:
                                                              "Appointment Rescheduled successfully.",
                                                          onOkPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            HomeScreen()));
                                                          },
                                                        );
                                                      });
                                                } else {
                                                  // ignore: use_build_context_synchronously
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return SingleInfoAlertBox(
                                                          text:
                                                              "Error in booking",
                                                          onOkPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        );
                                                      });
                                                }
                                              },
                                            );
                                          });
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return SingleInfoAlertBox(
                                              text: "Please login to book",
                                              onOkPressed: () {
                                                Navigator.pop(context);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SigninScreen()));
                                              },
                                            );
                                          });
                                    }
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return SingleInfoAlertBox(
                                            text: "Slot is not available",
                                            onOkPressed: () {
                                              Navigator.pop(context);
                                            },
                                          );
                                        });
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: isSlotAvailable
                                          ? Colors.grey
                                          : Colors.red, // Use suitable colors
                                      width: 1,
                                    ),
                                    color: isSlotAvailable
                                        ? Colors.green
                                        : Colors.red, // Use suitable colors
                                  ),
                                  child: Center(
                                    child: Text(
                                      singleSlotModel.hour,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
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
