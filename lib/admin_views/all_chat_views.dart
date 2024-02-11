import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pgc/admin_views/admin_chat_screen.dart';
import 'package:pgc/components/dashboard_card.dart';
import 'package:pgc/constants/const.dart';
import 'package:pgc/constants/helper_class.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/model/chat_model.dart';

class AllChatsAdminScreen extends StatefulWidget {
  const AllChatsAdminScreen({
    super.key,
  });

  @override
  State<AllChatsAdminScreen> createState() => _AllChatsAdminScreenState();
}

class _AllChatsAdminScreenState extends State<AllChatsAdminScreen> {
  List<ChatModel> chatList = [];
  Future<String> getAllChats() async {
    try {
      // Get all chats from the database
      chatList.clear();

      // Fetch appointments for today
      await FirebaseFirestore.instance
          .collection(Constants.fcChatNode)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          log(querySnapshot.docs.toString());
          chatList.add(ChatModel.fromMap(doc.data() as Map<String, dynamic>));
        });
      });
      return 'success';
    } catch (e) {
      log('Error: e');
      return 'error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('All Chats', style: kSubHeadingTextStyle)),
        body: SingleChildScrollView(
          child: Column(children: [
            FutureBuilder(
                future: getAllChats(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: chatList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AdminChatScreen(
                                            chatPlusUserId:
                                                chatList[index].chatId)));
                              },
                              child: RecentChat(
                                  id: chatList[index].chatId,
                                  chat: chatList[index].lastMessage,
                                  timestamp: HelperClass.formatTimestampToAmPm(
                                      chatList[index].lastMessageTimestamp)));
                        },
                      );
                    } else {
                      return Center(child: Text('No Data found'));
                    }
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else {
                    return Center(child: Text('Error'));
                  }
                })
          ]),
        ));
  }
}
