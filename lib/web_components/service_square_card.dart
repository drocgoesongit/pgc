import 'package:flutter/material.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/model/service_model.dart';
import 'package:pgc/views/service_detail_screen.dart';

class WebServiceSquareCard extends StatelessWidget {
  final String image;
  final String text;
  final String service;
  final Color color;
  const WebServiceSquareCard({
    Key? key,
    required this.image,
    required this.text,
    required this.color,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // Add navigation to service detail screen
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => ServicesDetailScreen(
          //               serviceId: model.serviceId,
          //               serviceModel: model,
          //             )));
        },
        child: SizedBox(
          width: 350,
          height: 480,
          child: Card(
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              // side: BorderSide(
              //   color: softGrayStrokeCustomColor,
              //   width: 2,
              // ),
            ),
            color: color,
            elevation: 0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150, // Adjust the width as needed
                    height: 150, // Adjust the height as needed
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.46),
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height /
                          20), // Adjust the spacing as needed
                  Text(
                    service,
                    overflow: TextOverflow.ellipsis,
                    style: kMainTitleBoldTextStyle.copyWith(
                        color: Colors.white, fontSize: 24),
                    maxLines: 2,
                    // textAlign: TextAlign.center,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),
                  Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                    style: kSmallParaTextStyle.copyWith(
                      color: Colors.white, // Adjust the font size as needed
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Learn more",
                        overflow: TextOverflow.ellipsis,
                        style:
                            kSmallParaTextStyle.copyWith(color: Colors.white),
                        maxLines: 2,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 16,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
