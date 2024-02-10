import 'package:flutter/material.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';

class AdminCard extends StatelessWidget {
  final String text;
  final String name;
  final String service;
  final String time;

  const AdminCard({
    Key? key,
    required this.time,
    required this.text,
    required this.name,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      elevation: 0,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(
          color: softGrayStrokeCustomColor,
          width: 2,
        ),
      ),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Image on the extreme left
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: TealDarkCustomColor, width: 2), // Outer circle
                ),
                child: Center(
                  child: Container(
                    height: 50, // Adjust the height as needed
                    width: 50, // Adjust the width as needed
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: TealLightCustomColor, // Inner circle color
                    ),
                    child: Center(
                      child: Text(
                        text,
                        style: kSubHeadingTextStyle, // Text color
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 20),
              // Column of multiple texts
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: kSmallParaTextStyle.copyWith(
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      service,
                      style: kSubHeadingTextStyle.copyWith(
                          color: TealDarkCustomColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              ClipPath(
                clipper: const ShapeBorderClipper(
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                child: Container(
                  width: 79,
                  height: 30,
                  color: TealLightCustomColor,
                  child: Center(
                      child: Text(
                    time,
                    style: kSmallParaTextStyle.copyWith(
                        color: TealDarkCustomColor),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomerCard extends StatelessWidget {
  final String text;
  final String name;
  final String visits;
  final String email;

  const CustomerCard({
    Key? key,
    required this.text,
    required this.name,
    required this.visits,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image on the extreme left
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: TealDarkCustomColor, width: 2), // Outer circle
            ),
            child: Center(
              child: Container(
                height: 45, // Adjust the height as needed
                width: 45, // Adjust the width as needed
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: TealLightCustomColor, // Inner circle color
                ),
                child: Center(
                  child: Text(
                    text,
                    style: kSubHeadingTextStyle, // Text color
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width / 20),
          // Column of multiple texts
          Expanded(
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: kSmallParaTextStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width / 15),
          Text(
            visits,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: kSmallParaTextStyle.copyWith(
                fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(width: MediaQuery.of(context).size.width / 10),
          Expanded(
            child: Text(
              email,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: kSmallParaTextStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
