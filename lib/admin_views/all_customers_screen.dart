import 'package:flutter/material.dart';
import 'package:pgc/admin_views/customer_detail_screen.dart';
import 'package:pgc/components/admin_rectangle_card.dart';
import 'package:pgc/components/dashboard_card.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';

class AllCustomer extends StatelessWidget {
  const AllCustomer({super.key});

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
                const DashboardCard(
                    text: "Appointments remaining",
                    icon: Icons.calendar_month_rounded,
                    num: "20"),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 60,
                ),
                const DashboardCard(
                    text: "Today's Appointment",
                    icon: Icons.description_rounded,
                    num: "12"),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 60,
                ),
                const DashboardCard(
                    text: "Today's Revenue",
                    icon: Icons.insert_chart_rounded,
                    num: "\$12,546"),
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomerDetailScreen()));
              },
              child: CustomerCard(
                  text: "DW",
                  name: "Daniel\nWelligton",
                  visits: "12",
                  email: "abc@gmail.com"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            CustomerCard(
                text: "DW",
                name: "Daniel\nWelligton",
                visits: "12",
                email: "abc@gmail.com"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            CustomerCard(
                text: "DW",
                name: "Daniel\nWelligton",
                visits: "12",
                email: "abc@gmail.com"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            CustomerCard(
                text: "DW",
                name: "Daniel\nWelligton",
                visits: "12",
                email: "abc@gmail.com"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            CustomerCard(
                text: "DW",
                name: "Daniel\nWelligton",
                visits: "12",
                email: "abc@gmail.com"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            CustomerCard(
                text: "DW",
                name: "Daniel\nWelligton",
                visits: "12",
                email: "abc@gmail.com"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            CustomerCard(
                text: "DW",
                name: "Daniel\nWelligton",
                visits: "12",
                email: "abc@gmail.com"),
          ],
        ),
      ),
    );
  }
}
