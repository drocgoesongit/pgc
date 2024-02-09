import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pgc/admin_views/add_new_service_screen.dart';
import 'package:pgc/admin_views/all_appointments_screen.dart';
import 'package:pgc/admin_views/customer_detail_screen.dart';
import 'package:pgc/components/appointment_rectangle_card.dart';
import 'package:pgc/components/home_screen_static_section.dart';
import 'package:pgc/components/review_card.dart';
import 'package:pgc/components/service_square_card.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/const.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pgc/model/appointment_model.dart';
import 'package:pgc/model/service_model.dart';
import 'package:pgc/viewmodels/chat_viewmodel.dart';
import 'package:pgc/views/all_services_screen.dart';
import 'package:pgc/views/dashboard_screen.dart';
import 'package:pgc/views/chat_screen.dart';
import 'package:pgc/views/profile_screen.dart';
import 'package:pgc/views/sign_in_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ServiceModel> services = [];
  List<AppointmentModel> appointments = [];

  Future<List<ServiceModel>> getServices() async {
    final servicesSnapshot = await FirebaseFirestore.instance
        .collection(Constants.fcServicesNode)
        .get();

    servicesSnapshot.docs.forEach((service) {
      services.add(ServiceModel.fromJson(service.data()));
    });

    return services;
  }

  Future<List<AppointmentModel>> getUpcomingAppointmentForUser() async {
    try {
      await FirebaseFirestore.instance
          .collection(Constants.fcAppointments)
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where('apptStatus', isEqualTo: Constants.appointmentActive)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          appointments.add(
              AppointmentModel.fromJson(doc.data() as Map<String, dynamic>));
        });
      });
      return appointments;
    } catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(
        children: [],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Column(
            children: [
              ClipPath(
                clipper: const ShapeBorderClipper(
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60))),
                ),
                child: Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width / 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: primaryBlueCustomColor,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/images/filter.png"),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 18,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Dashboard()));
                                },
                                child: Text(
                                  "Paws and Claws",
                                  style: kSmallParaTextStyle.copyWith(
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileScreen()));
                            },
                            child: Container(
                              child: Image.asset("assets/images/profile.png"),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.46))),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height / 100,
                      // ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  if (FirebaseAuth.instance.currentUser !=
                                      null) {
                                    showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: Center(
                                                child:
                                                    CircularProgressIndicator(
                                              color: primaryBlueCustomColor,
                                              strokeWidth: 2.0,
                                            )),
                                          );
                                        });
                                    String userId =
                                        FirebaseAuth.instance.currentUser!.uid;
                                    String isChatAvailable =
                                        await ChatViewModel().getChat();

                                    if (isChatAvailable == 'success') {
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChatDetailScreen(
                                                    chatPlusUserId: userId,
                                                  )));
                                    } else {
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Error: Chat not available'),
                                        ),
                                      );
                                    }
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: const Text("Error"),
                                              content: const Text(
                                                  "You need to be logged in to access this feature."),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const SigninScreen()));
                                                  },
                                                  child: Text("OK"),
                                                )
                                              ],
                                            ));
                                  }
                                },
                                child: Text(
                                  "Elevate Your\nPet Style!",
                                  style: kMainTitleBoldTextStyle.copyWith(
                                      color: Colors.white),
                                ),
                              ),
                              Center(
                                child: Container(
                                  child:
                                      Image.asset("assets/images/dogflyer.png"),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ServicesListScreen()));
                              },
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Services",
                    style: kSubHeadingTextStyle,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ServicesListScreen()));
                    },
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
                height: MediaQuery.of(context).size.height / 80,
              ),
              FutureBuilder(
                  future: getServices(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      return Container(
                        height: MediaQuery.of(context).size.height / 6.5,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: services.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ServiceSquareCard(
                              model: services[index],
                            );
                          },
                        ),
                      );
                    }
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height / 60,
              ),
              Text(
                "Upcoming appointments",
                style:
                    kSubHeadingTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              FutureBuilder(
                  future: getUpcomingAppointmentForUser(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: appointments.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AppointmentCard(
                              title: appointments[index].username,
                              day: appointments[index].apptDate,
                              time: appointments[index].apptTime,
                              petname: appointments[index].petName);
                        },
                      );
                    }
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height / 60,
              ),
              StaticSectionHomeScreen(),
            ]),
          ),
        ]),
      ),
    );
  }
}
