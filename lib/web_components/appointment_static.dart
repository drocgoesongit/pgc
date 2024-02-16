import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pgc/components/admin_rectangle_card.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/helper_class.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/model/appointment_model.dart';
import 'package:pgc/viewmodels/appointment_viewmodel.dart';

class AppointmentStatic extends StatefulWidget {
  AppointmentStatic({super.key, required this.dates});
  List<String> dates;

  @override
  State<AppointmentStatic> createState() => _AppointmentStaticState();
}

class _AppointmentStaticState extends State<AppointmentStatic> {
  String selectedDate = '';
  List<AppointmentModel> appointments = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedDate = HelperClass.getSameDayDate();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(
        //   width: MediaQuery.of(context).size.width / 80,
        // ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.dates.length,
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
                        log("selected date = ${widget.dates[index]}");
                        selectedDate = widget.dates[index];
                      });
                    },
                    child: ClipPath(
                      clipper: const ShapeBorderClipper(
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                      child: Container(
                        color: selectedDate == widget.dates[index]
                            ? primaryBlueCustomColor
                            : Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(widget.dates[index].substring(8, 10),
                                  style: kButtonBigTextStyle.copyWith(
                                      color: selectedDate == widget.dates[index]
                                          ? Colors.white
                                          : primaryBlueCustomColor)),
                              Text(
                                HelperClass.getMonthAbbreviation(
                                  widget.dates[index].substring(5, 7),
                                ),
                                style: kSmallParaTextStyle.copyWith(
                                    color: selectedDate == widget.dates[index]
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
        ClipPath(
          clipper: ShapeBorderClipper(
            shape: ContinuousRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
          ),
          child: Container(
            width: 400,
            padding: EdgeInsets.all(10),
            color: Colors.grey.shade100,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              FutureBuilder(
                  future:
                      AppointmentViewModel().fetchAppointments(selectedDate),
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
                      appointments = snapshot.data as List<AppointmentModel>;
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
      ],
    );
  }
}
