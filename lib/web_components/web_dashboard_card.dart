import 'package:flutter/material.dart';
import 'package:pgc/constants/text_const.dart';
// import 'package:pgc/model/service_model.dart';
// import 'package:pgc/views/service_detail_screen.dart';

class DashboardSquareCard extends StatelessWidget {
  final String text;
  final icon;
  final String num;
  final Color cuscolors;
  final Color strokecolors;

  const DashboardSquareCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.num,
    required this.cuscolors,
    required this.strokecolors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add navigation to service detail screen
      },
      child: Container(
        width: 140,
        height: 180,
        child: Card(
          color: cuscolors,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(
              color: strokecolors,
              width: 2,
            ),
          ),
          elevation: 0,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: strokecolors,
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16), // Adjust the spacing as needed
                Text(
                  num,
                  overflow: TextOverflow.ellipsis,
                  style: kMainTitleBoldTextStyle,
                  // maxLines: 2,
                  // textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Expanded(
                  child: Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                    style: kButtonBigTextStyle,
                    maxLines: 2,
                    // textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
