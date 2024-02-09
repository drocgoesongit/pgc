import 'package:flutter/material.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/model/service_model.dart';
import 'package:pgc/views/service_detail_screen.dart';

class ServiceSquareCard extends StatelessWidget {
  final ServiceModel model;

  const ServiceSquareCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add navigation to service detail screen
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ServicesDetailScreen(
                      serviceId: model.serviceId,
                      serviceModel: model,
                    )));
      },
      child: Card(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: softGrayStrokeCustomColor,
            width: 2,
          ),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80, // Adjust the width as needed
                height: 52, // Adjust the height as needed
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.46),
                  image: DecorationImage(
                    image: NetworkImage(model.servicePhotos[0]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 6), // Adjust the spacing as needed
              Text(
                model.serviceName,
                overflow: TextOverflow.ellipsis,
                style: kSmallParaTextStyle.copyWith(
                  fontSize: 12, // Adjust the font size as needed
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
