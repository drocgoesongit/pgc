import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pgc/components/single_info_alert_box.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/const.dart';
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
        datesList = HelperClass.generateDateList();
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
                                                                datesList[index]
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
                                                  "Are you sure you want to book this slot?",
                                              onOkPressed: () async {
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
                                                  // ignore: use_build_context_synchronously
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return SingleInfoAlertBox(
                                                          text:
                                                              "Appointment booked",
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
