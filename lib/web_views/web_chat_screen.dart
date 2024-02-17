import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/helper_class.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/web_components/chat_static.dart';
import 'package:pgc/web_components/dashboard_static.dart';
import 'package:pgc/web_views/web_appointment_screen.dart';
import 'package:pgc/web_views/web_dashboard_screen.dart';
import 'package:pgc/web_views/web_landing.dart';

class WebChat extends StatefulWidget {
  const WebChat({super.key});

  @override
  State<WebChat> createState() => _WebChatState();
}

class _WebChatState extends State<WebChat> {
  int _selectedIndex = 2;
  bool showleading = false;
  String selectedLanguage = 'English';
  NavigationRailLabelType labelType = NavigationRailLabelType.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.pie_chart_outline_rounded),
                selectedIcon: Icon(
                  Icons.pie_chart_rounded,
                  color: Colors.white,
                ),
                label: Text(
                  'Dashboard',
                  style: kSmallParaTextStyle.copyWith(fontSize: 12),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bar_chart_rounded),
                selectedIcon: Icon(
                  Icons.bar_chart_rounded,
                  color: Colors.white,
                ),
                label: Text(
                  'Appointments',
                  style: kSmallParaTextStyle.copyWith(fontSize: 12),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.chat_rounded),
                selectedIcon: Icon(
                  Icons.chat_rounded,
                  color: Colors.white,
                ),
                label: Text(
                  'Chats',
                  style: kSmallParaTextStyle.copyWith(fontSize: 12),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings_rounded),
                selectedIcon: Icon(
                  Icons.settings_rounded,
                  color: Colors.white,
                ),
                label: Text(
                  'Settings',
                  style: kSmallParaTextStyle.copyWith(fontSize: 12),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.logout_rounded),
                selectedIcon: Icon(
                  Icons.logout_rounded,
                  color: Colors.white,
                ),
                label: Text(
                  'Sign Out',
                  style: kSmallParaTextStyle.copyWith(fontSize: 12),
                ),
              ),
            ],
            labelType: labelType,
            indicatorColor: primaryBlueCustomColor,
            leading: FloatingActionButton(
              backgroundColor: primaryBlueCustomColor,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LandingPage()));
              },
              child: SvgPicture.asset("assets/images/logo.svg"),
            ),
            groupAlignment: 0,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
              if (index == 0) {
                // Navigate to the Appointments page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WebDashboard()),
                );
              }

              if (index == 1) {
                // Navigate to the Appointments page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WebAppoinment()),
                );
              }
              if (index == 2) {
                // Navigate to the Appointments page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WebChat()),
                );
              }
            },
            elevation: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 80),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      child: // Default language
                          Row(
                        children: [
                          Text(
                            "Chats",
                            style: kMainTitleBoldTextStyle,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 20,
                          ),
                          Expanded(
                            child: ClipPath(
                              clipper: ShapeBorderClipper(
                                shape: ContinuousRectangleBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30)),
                                    side: BorderSide.none),
                              ),
                              child: Container(
                                height:
                                    60, // Set a fixed height for the TextField
                                child: TextFormField(
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey.shade100,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    hintText: "Search here...",
                                    hintStyle: kSmallParaTextStyle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.search_rounded,
                                      color: primaryBlueCustomColor,
                                    ),
                                    border: InputBorder
                                        .none, // Remove the underline
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width / 40,
                          ), // Add some space between the text and the dropdown button
                          DropdownButton<String>(
                            value: selectedLanguage,
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  selectedLanguage = newValue;
                                });
                              }
                            },
                            items: <String>['English', 'Hindi', 'Arabic']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Row(
                                  children: [
                                    _buildFlagIcon(value),
                                    SizedBox(width: 8),
                                    Text(
                                      value,
                                      style: kSmallParaTextStyle,
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                            underline: Container(), // Remove the underline
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width / 40,
                          ),
                          Stack(
                            children: [
                              ClipPath(
                                clipper: ShapeBorderClipper(
                                  shape: ContinuousRectangleBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30)),
                                  ),
                                ),
                                child: Container(
                                  height: 48,
                                  width: 48,
                                  color: Colors.amberAccent.withOpacity(0.5),
                                  child: Icon(
                                    Icons.notifications_none_rounded,
                                    color: Colors.amber.shade700,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 90,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.asset("assets/images/profile.png"),
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.46))),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 90,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Name",
                                    style: kSmallParaTextStyle.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Admin",
                                    style: kSmallParaTextStyle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 40,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    WebChatStatic(
                        // dates: HelperClass.generateFuture20DateList(),
                        ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildFlagIcon(String language) {
  switch (language.toLowerCase()) {
    case 'english':
      return SvgPicture.asset(
        "assets/flags/usa.svg",
        height: 24,
        width: 24,
      );
    // return Image.asset('assets/images/usa_flag.png', width: 24, height: 24);
    case 'hindi':
      return SvgPicture.asset(
        "assets/flags/india.svg",
        height: 24,
        width: 24,
      );
    case 'arabic':
      return SvgPicture.asset(
        "assets/flags/canada.svg",
        height: 24,
        width: 24,
      );
    default:
      return SizedBox.shrink();
  }
}
