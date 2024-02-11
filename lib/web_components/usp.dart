import 'package:flutter/material.dart';
import 'package:pgc/constants/text_const.dart';

class Usp extends StatelessWidget {
  const Usp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 315,
          child: Center(
            // Center alignment
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Align text center
              children: [
                Text(
                  "100+",
                  style: kMainTitleBoldTextStyle,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 80),
                Text(
                  "Customer visit Purrfectly groomed every month to get their service.",
                  style: kSmallParaTextStyle,
                  textAlign: TextAlign.center, // Text alignment
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 315,
          child: Center(
            // Center alignment
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Align text center
              children: [
                Text(
                  "100%",
                  style: kMainTitleBoldTextStyle,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 80),
                Text(
                  "Satisfaction rate comes from our awesome customers.",
                  style: kSmallParaTextStyle,
                  textAlign: TextAlign.center, // Text alignment
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 315,
          child: Center(
            // Center alignment
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Align text center
              children: [
                Text(
                  "4.9/5.0",
                  style: kMainTitleBoldTextStyle,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 80),
                Text(
                  "Average customer ratings we have got all over internet.",
                  style: kSmallParaTextStyle,
                  textAlign: TextAlign.center, // Text alignment
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
