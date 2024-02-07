import 'package:flutter/material.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/text_const.dart';

class ScheduleCard extends StatefulWidget {
  final String title;
  final String subtitle;

  const ScheduleCard({required this.title, required this.subtitle});

  @override
  _ScheduleCardState createState() => _ScheduleCardState();
}

class _ScheduleCardState extends State<ScheduleCard> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTapped = !isTapped;
        });
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.46),
          border: Border.all(
            color: softGrayStrokeCustomColor,
            width: 2,
          ),
          color: isTapped ? primaryBlueCustomColor : Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: kSmallParaTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: isTapped ? Colors.white : primaryBlueSoftenCustomColor,
              ),
            ),
            Text(
              widget.subtitle,
              style: kSmallParaTextStyle.copyWith(
                fontSize: 14,
                color: isTapped ? Colors.white : primaryBlueSoftenCustomColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class VisitHours extends StatefulWidget {
//   final String date;
//   const VisitHours({super.key, required this.date});

//   @override
//   State<VisitHours> createState() => _VisitHoursState();
// }

// class _VisitHoursState extends State<VisitHours> {
//   bool isTapped = false;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         // padding: EdgeInsets.only(left: 8.0),
//         width: 75,
//         height: 35,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15.46),
//           border: Border.all(
//             color: softGrayStrokeCustomColor,
//             width: 2,
//           ),
//           color: isTapped ? primaryBlueCustomColor : Colors.transparent,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               widget.date,
//               style: kSmallParaTextStyle.copyWith(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 12,
//                 color: isTapped ? Colors.white : primaryBlueSoftenCustomColor,
//               ),
//             ),
//           ],
//         ));
//   }
// }


// Example usage:
// CustomCard(title: "Title", subtitle: "Subtitle");
