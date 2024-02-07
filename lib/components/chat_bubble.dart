import 'package:flutter/material.dart';
import 'package:pgc/constants/const.dart';
import 'package:pgc/constants/helper_class.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/model/message_model.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.messageModel});

  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: messageModel.sender == Constants.fcAdmins
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth:
              MediaQuery.of(context).size.width * 0.7, // Limit bubble width
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: messageModel.sender == Constants.fcAdmins
              ? Colors.grey[300]
              : Colors.blue[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              messageModel.content,
              style: kSmallParaTextStyle.copyWith(fontWeight: FontWeight.w600),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4),
            Text(
              HelperClass.formatTimestampToAmPm(messageModel.timestamp),
              style: kSmallParaTextStyle.copyWith(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
