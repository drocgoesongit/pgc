import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pgc/components/admin_chat_bubble.dart';
import 'package:pgc/components/chat_bubble.dart';
import 'package:pgc/constants/color_const.dart';
import 'package:pgc/constants/const.dart';
import 'package:pgc/constants/helper_class.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/model/message_model.dart';
import 'package:pgc/model/user_model.dart';

class AdminChatScreen extends StatefulWidget {
  const AdminChatScreen({super.key, required this.chatPlusUserId});
  final String chatPlusUserId;

  @override
  State<AdminChatScreen> createState() => _AdminChatScreenState();
}

class _AdminChatScreenState extends State<AdminChatScreen> {
  late TextEditingController _messageController;
  FocusNode _messageFocusNode = FocusNode();

  String message = "";

  Stream<List<MessageModel>> getGroupChat(String productId) {
    return FirebaseFirestore.instance
        .collection(Constants.fcChatNode)
        .doc(widget.chatPlusUserId)
        .collection(Constants.fcMessagesNode)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => MessageModel.fromMap(doc.data()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    _messageFocusNode.addListener(() {
      if (!_messageFocusNode.hasFocus) {
        // Clear the input field after losing focus
      }
    });
  }

  Future<String> sendMessageToDatabase(
      MessageModel message, String chatPlusUserId) async {
    try {
      await FirebaseFirestore.instance
          .collection(Constants.fcChatNode)
          .doc(chatPlusUserId)
          .collection(Constants.fcMessagesNode)
          .doc(message.messageId)
          .set(
            message.toMap(),
          );
      return 'success';
    } catch (e) {
      return 'error';
    }
  }

  Future<void> sendMessage(BuildContext context) async {
    if (message.isNotEmpty) {
      log("starting to send message and message is not empty.");
      String randomId = HelperClass.generateRandomString();
      int timeStamp = DateTime.now().millisecondsSinceEpoch;
      MessageModel messageModel = MessageModel(
        messageId: randomId,
        content: message,
        imageUrl: "",
        timestamp: timeStamp,
        receiver: widget.chatPlusUserId,
        sender: Constants.fcAdmins,
      );
      log("model created successfully. ");
      await sendMessageToDatabase(messageModel, widget.chatPlusUserId);
      _messageController.clear();
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Chat",
            style: kSubHeadingTextStyle,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: primaryBlueSoftenCustomColor,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<MessageModel>>(
              stream: getGroupChat(widget.chatPlusUserId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.data!.isEmpty) {
                  return Center(child: Text('No messages available.'));
                } else if (snapshot.hasData) {
                  List<MessageModel> messages = snapshot.data!;

                  return ListView.builder(
                    reverse:
                        true, // To display the latest messages at the bottom
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      MessageModel message = messages[index];
                      return AdminChatBubble(messageModel: message);
                    },
                  );
                } else {
                  return Center(child: Text('No messages available.'));
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 24,
                right: MediaQuery.of(context).size.width / 24,
                bottom: 16,
                top: 6),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: primaryBlueSoftenCustomColor),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: primaryBlueSoftenCustomColor,
                      controller: _messageController,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 16,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Write your message',
                        hintStyle:
                            TextStyle(fontFamily: "Gilroy", fontSize: 14),
                      ),
                      focusNode: _messageFocusNode,
                      onChanged: (value) {},
                      maxLines: null,
                      minLines: 1,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 8),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Handle microphone icon onTap
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 7.0),
                            child: Icon(
                              Icons.add_photo_alternate_rounded,
                              color: primaryBlueSoftenCustomColor,
                              size: 24,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle microphone icon onTap
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 7.0),
                            child: Icon(
                              Icons.mic_rounded,
                              color: primaryBlueSoftenCustomColor,
                              size: 24,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            message = _messageController.text.trim();
                            await sendMessage(context);
                            _messageController.clear();
                          },
                          child: Icon(
                            Icons.send_rounded,
                            color: primaryBlueSoftenCustomColor,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
