import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pgc/components/chat_bubble.dart';
import 'package:pgc/constants/const.dart';
import 'package:pgc/constants/helper_class.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/model/message_model.dart';
import 'package:pgc/model/user_model.dart';
import 'package:pgc/viewmodels/chat_viewmodel.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key, required this.chatPlusUserId});
  final String chatPlusUserId;

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
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
        sender: widget.chatPlusUserId,
        receiver: Constants.fcAdmins,
      );
      log("model created successfully. ");
      ChatViewModel().sendMessage(messageModel, widget.chatPlusUserId);
      _messageController.clear();
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat with owner",
          style: kSubHeadingTextStyle,
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - 100,
        child: Column(children: [
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

                      return ChatBubble(messageModel: message);
                    },
                  );
                } else {
                  return Center(child: Text('No messages available.'));
                }
              },
            ),
          ),
          // The input field for typing messages---------- ---------
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _messageController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.black, // Border color
                          width: 1, // Border width
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.black, // Focused border color
                          width: 1, // Border width
                        ),
                      ),
                      hintText: 'Type a message...',
                      hintStyle: TextStyle(fontFamily: "Inter"),
                    ),
                    focusNode: _messageFocusNode,
                    onChanged: (value) {},
                    maxLines: null,
                    minLines: 1,
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () async {
                    message = _messageController.text.trim();
                    await sendMessage(context);
                    _messageController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.all(16),
                  ),
                  child: Icon(
                    Icons.send_rounded,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
