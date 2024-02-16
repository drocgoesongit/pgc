// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pgc/components/schedule_card.dart';
import 'package:pgc/components/single_info_alert_box.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/helper_class.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/model/hour_slot_model.dart';
import 'package:pgc/model/one_hour_model.dart';
import 'package:pgc/model/service_model.dart';
import 'package:pgc/viewmodels/appointment_viewmodel.dart';
import 'package:pgc/viewmodels/slots_status_viewmodel.dart';
import 'package:pgc/views/home_screen.dart';
import 'package:pgc/views/sign_in_screen.dart';

class ServicesDetailScreen extends StatefulWidget {
  const ServicesDetailScreen(
      {super.key, required this.serviceModel, required this.serviceId});
  final ServiceModel serviceModel;
  final String serviceId;

  @override
  State<ServicesDetailScreen> createState() => _ServicesDetailScreenState();
}

class _ServicesDetailScreenState extends State<ServicesDetailScreen> {
  String selectedDate = "";
  List<String> datesList = [];
  late OneHourAvaialabilityModel avaialabilityModel;

  Future<OneHourAvaialabilityModel> getDates(String date) async {
    try {
      if (selectedDate == "") {
        datesList = HelperClass.generateFuture20DateList();
        selectedDate = HelperClass.getSameDayDate();
        avaialabilityModel = await SlotsStatusViewModel()
            .getOneHourAvailability(widget.serviceId, selectedDate);
      } else {
        avaialabilityModel = await SlotsStatusViewModel()
            .getOneHourAvailability(widget.serviceId, selectedDate);
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
        title: Text("Book Appointment", style: kSubHeadingTextStyle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align elements to the left
            children: [
              CarouselSlider(
                items: widget.serviceModel.servicePhotos.map((imageUrl) {
                  return Container(
                    // margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 200.0, // Adjust the height as needed
                  aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.serviceModel.serviceName,
                    style: kMainTitleBoldTextStyle.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "\$ ${widget.serviceModel.serviceFees.toString()}",
                    style: kMainTitleBoldTextStyle.copyWith(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              Text(
                "About service",
                style:
                    kSmallParaTextStyle.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 80,
              ),
              Text(
                widget.serviceModel.serviceDescription,
                style: kSmallParaTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              // Text("Service Description", style: kSubHeadingTextStyle),
              // Text(2
              //   widget.serviceModel.serviceDescription,
              //   maxLines: 3,
              //   overflow: TextOverflow.ellipsis,
              //   style: kSmallParaTextStyle,
              // ),
              const SizedBox(height: 16.0),
              FutureBuilder(
                  future: getDates(selectedDate),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                          color:
                                              selectedDate == datesList[index]
                                                  ? TealDarkCustomColor
                                                  : Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
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
                              },
                            ),
                          ),
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
                                          return AlertDialog(
                                            shape: ContinuousRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            surfaceTintColor:
                                                Colors.transparent,
                                            title: Text(
                                              "Are you sure you want to book this slot?",
                                              style: kSubHeadingTextStyle,
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () async {
                                                  log("User is logged in.");
                                                  log("booking for date: $selectedDate, time: ${singleSlotModel.hour}");

                                                  String result =
                                                      await AppointmentViewModel()
                                                          .bookAppointment(
                                                    widget.serviceId,
                                                    selectedDate,
                                                    singleSlotModel.hour,
                                                    FirebaseAuth.instance
                                                        .currentUser!.uid,
                                                    "petId",
                                                    selectedDate,
                                                  );

                                                  if (result == "success") {
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
                                                              "Appointment booked",
                                                              style:
                                                                  kSubHeadingTextStyle),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context); // Dismiss the success dialog
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            HomeScreen(),
                                                                  ),
                                                                );
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
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context); // Dismiss the error dialog
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
                                                child: Text(
                                                  "OK",
                                                  style: kSubHeadingTextStyle
                                                      .copyWith(
                                                    color:
                                                        const Color(0xFF877FFA),
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
                                        return AlertDialog(
                                          shape: ContinuousRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          surfaceTintColor: Colors.transparent,
                                          title: Text(
                                            "Slot is not available",
                                            style: kSubHeadingTextStyle,
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "OK",
                                                style: kSubHeadingTextStyle
                                                    .copyWith(
                                                  color:
                                                      const Color(0xFF877FFA),
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
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
                                          style: kSmallParaTextStyle.copyWith(
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 12,
                                    height: 12,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 0.5,
                                        ),
                                        color: Colors.redAccent,
                                        borderRadius: BorderRadius.circular(2)),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Booked",
                                    style: kSmallParaTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 12,
                                    height: 12,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 0.5,
                                        ),
                                        color: TealLightCustomColor,
                                        borderRadius: BorderRadius.circular(2)),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Available",
                                    style: kSmallParaTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
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
                                "Book Appointment",
                                style: kButtonBigTextStyle.copyWith(
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
