import 'package:flutter/material.dart';
import 'package:pgc/constants/text_const.dart';

class ServiceCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const ServiceCard({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2, // Add elevation if desired
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: Colors.blueGrey.shade300,
            width: 2,
          )),
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 13),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image on the extreme left
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Column of multiple texts
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: kSmallParaTextStyle.copyWith(
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: kSmallParaTextStyle.copyWith(
                        fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  Row(
                    children: [
                      Text(
                        "View detail",
                        style: kSmallParaTextStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 12,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
