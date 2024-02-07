import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pgc/constants/const.dart';
import 'package:pgc/model/chat_model.dart';
import 'package:pgc/model/message_model.dart';

class ChatViewModel {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String userId = FirebaseAuth.instance.currentUser!.uid;

  Future<String> getChat() async {
    try {
      // check if chat exists
      _firestore.collection(Constants.fcChatNode).doc(userId).get().then((doc) {
        if (doc.exists) {
          return 'success';
        } else {
          // create chat nodes
          ChatModel chatModel = ChatModel(
            chatId: userId,
            lastMessage: "",
            lastMessageTimestamp: DateTime.now().millisecondsSinceEpoch,
            userRead: true,
            ownerRead: true,
          );
          _firestore.collection(Constants.fcChatNode).doc(userId).set(
                chatModel.toMap(),
              );
          return 'success';
        }
      });
      return 'success';
    } catch (e) {
      return 'error';
    }
  }

  Future<String> sendMessage(
      MessageModel message, String chatPlusUserId) async {
    try {
      await _firestore
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
}
