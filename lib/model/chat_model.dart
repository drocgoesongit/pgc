class ChatModel {
  String chatId;
  String lastMessage;
  bool userRead;
  bool ownerRead;
  int lastMessageTimestamp;

  ChatModel({
    required this.chatId,
    required this.lastMessage,
    required this.userRead,
    required this.ownerRead,
    required this.lastMessageTimestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'chatId': chatId,
      'lastMessage': lastMessage,
      'userRead': userRead,
      'ownerRead': ownerRead,
      'lastMessageTimestamp': lastMessageTimestamp,
    };
  }

  static ChatModel fromMap(Map<String, dynamic> map) {
    return ChatModel(
      chatId: map['chatId'],
      lastMessage: map['lastMessage'],
      userRead: map['userRead'],
      ownerRead: map['ownerRead'],
      lastMessageTimestamp: map['lastMessageTimestamp'],
    );
  }
}
