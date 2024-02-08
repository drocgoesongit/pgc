import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pgc/admin_views/customer_detail_screen.dart';
import 'package:pgc/components/admin_rectangle_card.dart';
import 'package:pgc/components/dashboard_card.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/const.dart';
import 'package:pgc/constants/helper_class.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/model/user_model.dart';

class AllCustomer extends StatelessWidget {
  AllCustomer(
      {super.key,
      required this.numberOfTotalCustomers,
      required this.numberOfAppointmentsRemaining,
      required this.numberOfTodaysAppointments});
  List<UserModel> customersList = [];
  final int numberOfTotalCustomers;
  final int numberOfAppointmentsRemaining;
  final int numberOfTodaysAppointments;

  Future<List<UserModel>> getAllCustomers() async {
    // Fetch all customers
    try {
      // Fetch appointments for today
      await FirebaseFirestore.instance
          .collection(Constants.fcUsers)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          log(querySnapshot.docs.toString());
          customersList
              .add(UserModel.fromJson(doc.data() as Map<String, dynamic>));
        });
      });
      return customersList;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: primaryBlueSoftenCustomColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text("All customers", style: kMainTitleBoldTextStyle),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DashboardCard(
                    text: "Appointments remaining",
                    icon: Icons.calendar_month_rounded,
                    value: numberOfAppointmentsRemaining.toString()),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 60,
                ),
                DashboardCard(
                    text: "Today's Appointment",
                    icon: Icons.description_rounded,
                    value: numberOfTodaysAppointments.toString()),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 60,
                ),
                DashboardCard(
                    text: "Total Customers",
                    icon: Icons.insert_chart_rounded,
                    value: numberOfTotalCustomers.toString()),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Spacer(),
                Spacer(),
                Text(
                  "Customer name",
                  style: kSmallParaTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.black),
                ),
                Spacer(),
                Text(
                  "No. of visits",
                  style: kSmallParaTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.black),
                ),
                Spacer(),
                Text(
                  "Email/Phone",
                  style: kSmallParaTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 80,
            ),
            FutureBuilder(
                future: getAllCustomers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return ListView.builder(
                      itemCount: customersList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CustomerDetailScreen()));
                          },
                          child: CustomerCard(
                              email: customersList[index].email,
                              text: HelperClass.getInitials(
                                customersList[index].firstName,
                                customersList[index].lastName,
                              ),
                              visits: customersList[index]
                                  .appointments
                                  .length
                                  .toString(),
                              name:
                                  "${customersList[index].firstName} ${customersList[index].lastName}"),
                        );
                      },
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
