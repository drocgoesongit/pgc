import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pgc/components/appointment_rectangle_card.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/const.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/model/appointment_model.dart';
import 'package:pgc/model/user_model.dart';
import 'package:pgc/views/dashboard_screen.dart';
import 'package:pgc/views/signin_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<AppointmentModel> appointments = [];
  bool admin = false;

  Future<UserModel> _fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance
        .collection("admin")
        .where('admin', isEqualTo: user!.uid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        admin = true;
      }
    });
    if (user != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      return UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception('User not logged in');
    }
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

  Widget buildMenuItem(IconData icon, String title) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: primaryBlueSoftenCustomColor,
            ),
            const Padding(padding: EdgeInsets.only(left: 15)),
            Text(
              title,
              style: kSubHeadingTextStyle,
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: kSubHeadingTextStyle),
      ),
      body: FutureBuilder<UserModel>(
        future: _fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Column(
              children: [
                Text('Error: ${snapshot.error}'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));
                  },
                  child: Text('Login'),
                ),
              ],
            ));
          } else if (!snapshot.hasData) {
            return GestureDetector(
              onTap: () {
                // Navigate to login screen
                Navigator.pushNamed(context, '/login');
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/not_logged_in_image.png'),
                    Text('Not Logged In'),
                  ],
                ),
              ),
            );
          } else {
            UserModel user = snapshot.data!;
            // Display user data
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text('Welcome, ${user.firstName} ${user.lastName}'),
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
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 80),
                    Divider(
                      thickness: 1,
                      color: primaryBlueSoftenCustomColor,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                    Text(
                      "Upcoming appointments",
                      style: kSubHeadingTextStyle.copyWith(
                          fontWeight: FontWeight.bold),
                    ),
                    FutureBuilder(
                        future: getUpcomingAppointmentForUser(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
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
                    SizedBox(height: MediaQuery.of(context).size.height / 80),
                    Divider(
                      thickness: 1,
                      color: primaryBlueSoftenCustomColor,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                    Text(
                      "Settings",
                      style: kSubHeadingTextStyle.copyWith(
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                    GestureDetector(
                        onTap: () {},
                        child: buildMenuItem(
                            Icons.question_answer_rounded, "FAQs")),
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                    GestureDetector(
                        onTap: () {},
                        child: buildMenuItem(Icons.info_rounded, "About us")),
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                    if (admin)
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dashboard()));
                          },
                          child: buildMenuItem(
                              Icons.support_agent_rounded, "Admin Panel")),
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                    GestureDetector(
                        onTap: () {},
                        child: buildMenuItem(Icons.logout_rounded, "Log Out")),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
