import 'package:flutter/material.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/const.dart';
import 'package:pgc/constants/helper_class.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/model/message_model.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.messageModel});

  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 24,
        vertical: MediaQuery.of(context).size.height / 60,
      ),
      child: Align(
        alignment: messageModel.sender == Constants.fcAdmins
            ? Alignment.centerLeft
            : Alignment.centerRight,
        child: Column(
          crossAxisAlignment: messageModel.sender == Constants.fcAdmins
              ? CrossAxisAlignment
                  .start // Align timestamp to the left if sender is admin
              : CrossAxisAlignment.end,
          children: [
            ClipPath(
              clipper: ShapeBorderClipper(
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width *
                      0.7, // Limit bubble width
                ),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: messageModel.sender == Constants.fcAdmins
                        ? primaryBlueSoftenCustomColor
                        : Colors
                            .transparent, // Outline border if sender is admin
                    width: 2,
                  ),
                  // borderRadius: BorderRadius.circular(30),
                  color: messageModel.sender == Constants.fcAdmins
                      ? softWhiteCustomColor
                      : primaryBlueSoftenCustomColor,
                ),
                child: Text(
                  messageModel.content,
                  style: kSmallParaTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    color: messageModel.sender == Constants.fcAdmins
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
              alignment: messageModel.sender == Constants.fcAdmins
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
