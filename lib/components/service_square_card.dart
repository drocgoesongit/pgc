import 'package:flutter/material.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';

class SquareCard extends StatelessWidget {
  final String image;
  final String text;

  const SquareCard({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.46),
          side: BorderSide(
            color: softGrayStrokeCustomColor,
            width: 2,
          )),
      surfaceTintColor: Colors.white,
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
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 4), // Adjust the spacing as needed
            Text(
              text,
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
    );
  }
}

// Example usage:
// CustomCard(imagePath: 'assets/example_image.jpg', text: 'Example Text');
