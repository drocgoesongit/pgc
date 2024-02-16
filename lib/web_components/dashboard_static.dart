import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pgc/components/admin_rectangle_card.dart';
import 'package:pgc/components/dashboard_card.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/web_components/web_dashboard_card.dart';

class DashboardStatic extends StatelessWidget {
  const DashboardStatic({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipPath(
              clipper: ShapeBorderClipper(
                shape: ContinuousRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today's",
                      style: kMainTitleBoldTextStyle.copyWith(fontSize: 20),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),
                    Text(
                      "Summary",
                      style: kSmallParaTextStyle,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DashboardSquareCard(
                            cuscolors: RedAccentCustomColor,
                            strokecolors: Colors.redAccent,
                            icon: Icons.bar_chart_rounded,
                            text: "Total Appointments",
                            num: "14"),
                        DashboardSquareCard(
                            cuscolors: AmberCustomColor,
                            strokecolors: Colors.amberAccent,
                            icon: Icons.description_rounded,
                            text: "Remaining Appointments",
                            num: "5"),
                        DashboardSquareCard(
                            cuscolors: GreenAccentCustomColor,
                            strokecolors: Colors.greenAccent,
                            icon: Icons.local_offer_rounded,
                            text: "Total Customers",
                            num: "5"),
                        DashboardSquareCard(
                            cuscolors: PurpleCustomColor.withOpacity(0.2),
                            strokecolors: PurpleCustomColor,
                            icon: Icons.person_add_alt_1_rounded,
                            text: "New Customers",
                            num: "1"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 80,
            ),
            Expanded(
              child: ClipPath(
                clipper: ShapeBorderClipper(
                  shape: ContinuousRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 280,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Appointments Trends",
                            style:
                                kMainTitleBoldTextStyle.copyWith(fontSize: 20),
                          ),
                          Text(
                            "(comming soon)",
                            style: kSmallParaTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 60,
                      ),
                      SvgPicture.asset("assets/images/analytics.svg")
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 40,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipPath(
                  clipper: ShapeBorderClipper(
                    shape: ContinuousRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                  child: Container(
                    width: 600,
                    padding: EdgeInsets.all(10),
                    color: Colors.grey.shade100,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recent Chats",
                              style: kSmallParaTextStyle.copyWith(
                                  fontWeight: FontWeight.w600),
                            ),
                            Row(
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
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                        RecentChat(
                            image: "assets/images/profile.png",
                            id: "Jane D.",
                            chat: "Ill be there",
                            timestamp: "12:54"),
                        RecentChat(
                            image: "assets/images/profile.png",
                            id: "Jane D.",
                            chat: "Ill be there",
                            timestamp: "12:54"),
                        RecentChat(
                            image: "assets/images/profile.png",
                            id: "Jane D.",
                            chat: "Ill be there",
                            timestamp: "12:54"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 60,
                ),
                ClipPath(
                  clipper: ShapeBorderClipper(
                    shape: ContinuousRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                  child: Container(
                    width: 600,
                    padding: EdgeInsets.all(10),
                    color: Colors.grey.shade100,
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Customers",
                            style: kSmallParaTextStyle.copyWith(
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
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
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 80,
            ),
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
            SizedBox(
              width: MediaQuery.of(context).size.width / 80,
            ),
            Expanded(
              child: ClipPath(
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
            ),
          ],
        ),
      ],
    );
  }
}
