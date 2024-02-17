import 'package:flutter/material.dart';
import 'package:pgc/components/admin_rectangle_card.dart';
import 'package:pgc/components/appointment_rectangle_card.dart';
import 'package:pgc/components/dashboard_card.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/model/appointment_model.dart';
import 'package:pgc/viewmodels/appointment_viewmodel.dart';

class CustomerDetailStatic extends StatefulWidget {
  const CustomerDetailStatic({super.key});

  @override
  State<CustomerDetailStatic> createState() => _CustomerDetailStaticState();
}

class _CustomerDetailStaticState extends State<CustomerDetailStatic> {
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
                            "Customers",
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
                      CustomerCard(
                          email: "janedaniel12@gmail.com",
                          text: "JD",
                          visits: "12",
                          name: "Jane D."),
                      CustomerCard(
                          email: "janedaniel12@gmail.com",
                          text: "JD",
                          visits: "12",
                          name: "Jane D."),
                      CustomerCard(
                          email: "janedaniel12@gmail.com",
                          text: "JD",
                          visits: "12",
                          name: "Jane D."),
                      CustomerCard(
                          email: "janedaniel12@gmail.com",
                          text: "JD",
                          visits: "12",
                          name: "Jane D."),
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
                  children: [
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
                              "Jane D.",
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
                                  "Bella",
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
                                      "Today",
                                      style: kSmallParaTextStyle.copyWith(
                                          fontSize: 14),
                                    ),
                                    Text(
                                      "12:00 am",
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                    Text(
                      "Past appointments",
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
                    SizedBox(height: MediaQuery.of(context).size.height / 80),
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
                    SizedBox(height: MediaQuery.of(context).size.height / 10),
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
