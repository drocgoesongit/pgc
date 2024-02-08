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
      padding: EdgeInsets.all(MediaQuery.of(context).size.width / 24),
      child: Container(
        child: Align(
          alignment: messageModel.sender == Constants.fcAdmins
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipPath(
                clipper: ShapeBorderClipper(
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    side: messageModel.sender == Constants.fcAdmins
                        ? BorderSide(
                            color: primaryBlueSoftenCustomColor, width: 2)
                        : BorderSide.none,
                  ),
                ),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width *
                        0.7, // Limit bubble width
                  ),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
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
                            : softWhiteCustomColor),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Text(
                HelperClass.formatTimestampToAmPm(messageModel.timestamp),
                style: kSmallParaTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
