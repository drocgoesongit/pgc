import 'package:flutter/material.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/const.dart';
import 'package:pgc/constants/helper_class.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/model/message_model.dart';

class AdminChatBubble extends StatelessWidget {
  const AdminChatBubble({super.key, required this.messageModel});

  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 24,
        right: MediaQuery.of(context).size.width / 24,
        top: 8,
      ),
      child: Align(
        alignment: messageModel.sender != Constants.fcAdmins
            ? Alignment.centerLeft
            : Alignment.centerRight,
        child: Column(
          crossAxisAlignment: messageModel.sender != Constants.fcAdmins
              ? CrossAxisAlignment
                  .start // Align timestamp to the left if sender is admin
              : CrossAxisAlignment.end,
          children: [
            Card(
              color: messageModel.sender != Constants.fcAdmins
                  ? softWhiteCustomColor
                  : primaryBlueSoftenCustomColor,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: messageModel.sender != Constants.fcAdmins
                        ? softGrayStrokeCustomColor
                        : Colors.transparent,
                    width: 2,
                  )),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width *
                      0.7, // Limit bubble width
                ),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(30),

                    ),
                child: Text(
                  messageModel.content,
                  style: kSmallParaTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    color: messageModel.sender != Constants.fcAdmins
                        ? primaryBlueSoftenCustomColor
                        : softWhiteCustomColor,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            SizedBox(height: 5), // Adjust spacing between message and timestamp
            Align(
              alignment: messageModel.sender != Constants.fcAdmins
                  ? Alignment
                      .centerLeft // Align timestamp to left if sender is admin
                  : Alignment.centerRight,
              child: Text(
                HelperClass.formatTimestampToAmPm(messageModel.timestamp),
                style: kSmallParaTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
