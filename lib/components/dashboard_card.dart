import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';

class DashboardCard extends StatelessWidget {
  final icon;
  final String text;
  final String value;

  const DashboardCard({
    Key? key,
    required this.text,
    required this.icon,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(
          color: softGrayStrokeCustomColor,
          width: 2,
        ),
      ),
      surfaceTintColor: Colors.white,
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: Colors.black,
                size: 24,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              // SizedBox(height: 4), // Adjust the spacing as needed
              Text(
                text,
                style: kSmallParaTextStyle.copyWith(
                    fontSize: 12, // Adjust the font size as needed
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                maxLines: 2,
              ),
              Text(
                value,
                style: kSmallParaTextStyle.copyWith(
                    fontSize: 20, // Adjust the font size as needed
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomerDetailCard extends StatelessWidget {
  final icon;
  final String text;
  final String num;

  const CustomerDetailCard({
    Key? key,
    required this.text,
    required this.icon,
    required this.num,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.46),
        side: BorderSide(
          color: softGrayStrokeCustomColor,
          width: 2,
        ),
      ),
      surfaceTintColor: Colors.white,
      child: Container(
        width: 160,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: primaryBlueSoftenCustomColor,
                size: 24,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 60,
              ),
              // SizedBox(height: 4), // Adjust the spacing as needed
              Text(
                text,
                style: kSmallParaTextStyle.copyWith(
                    fontSize: 12, // Adjust the font size as needed
                    fontWeight: FontWeight.w400,
                    color: primaryBlueSoftenCustomColor),
                maxLines: 2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 80,
              ),
              Text(
                num,
                style: kSmallParaTextStyle.copyWith(
                    fontSize: 20, // Adjust the font size as needed
                    fontWeight: FontWeight.w600,
                    color: primaryBlueSoftenCustomColor),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecentChat extends StatelessWidget {
  final String id;
  final String chat;
  final String timestamp;

  const RecentChat({
    Key? key,
    required this.id,
    required this.chat,
    required this.timestamp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.png'),
            radius: 24,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(id,
                  style: kSmallParaTextStyle.copyWith(
                      fontWeight: FontWeight.bold)),
              Text(
                chat,
                style: kSmallParaTextStyle.copyWith(
                    fontSize: 14, color: Colors.grey.shade800),
              ),
            ],
          ),
          Spacer(), // Add flexible space to push the timestamp to the right
          Text(
            timestamp,
            style: kSmallParaTextStyle.copyWith(
                fontSize: 12, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
