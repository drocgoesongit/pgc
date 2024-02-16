import 'package:flutter/material.dart';
import 'package:pgc/components/admin_rectangle_card.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/helper_class.dart';
import 'package:pgc/constants/text_const.dart';

class AppointmentStatic extends StatefulWidget {
  const AppointmentStatic({super.key});

  @override
  State<AppointmentStatic> createState() => _AppointmentStaticState();
}

class _AppointmentStaticState extends State<AppointmentStatic> {
  String selectedDate = '';
  List<String> datesList = [];
  @override
  Widget build(BuildContext context) {
    return Column(
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
                        // log("selected date = ${datesList[index]}");
                        // selectedDate = datesList[index];
                      });
                    },
                    child: ClipPath(
                      clipper: const ShapeBorderClipper(
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                      child: Container(
                        color: selectedDate == datesList[index]
                            ? TealDarkCustomColor
                            : Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(datesList[index].substring(8, 10),
                                  style: kButtonBigTextStyle.copyWith(
                                      color: selectedDate == datesList[index]
                                          ? Colors.white
                                          : primaryBlueSoftenCustomColor)),
                              Text(
                                HelperClass.getMonthAbbreviation(
                                  datesList[index].substring(5, 7),
                                ),
                                style: kSmallParaTextStyle.copyWith(
                                    color: selectedDate == datesList[index]
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
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Upcomming Appointments",
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
              AdminCard(
                  time: "12:00",
                  text: "JD",
                  name: "Jane D.",
                  service: "Luxury Spa"),
              AdminCard(
                  time: "12:00",
                  text: "JD",
                  name: "Jane D.",
                  service: "Luxury Spa"),
              AdminCard(
                  time: "12:00",
                  text: "JD",
                  name: "Jane D.",
                  service: "Luxury Spa"),
              AdminCard(
                  time: "12:00",
                  text: "JD",
                  name: "Jane D.",
                  service: "Luxury Spa"),
              AdminCard(
                  time: "12:00",
                  text: "JD",
                  name: "Jane D.",
                  service: "Luxury Spa"),
            ]),
          ),
        ),
      ],
    );
  }
}
