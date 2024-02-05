class MessageModel {
  final String messageId;
  final String content;
  final String imageUrl;
  final int timestamp;
  final String sender;
  final String receiver;

  MessageModel({
    required this.messageId,
    required this.content,
    required this.imageUrl,
    required this.timestamp,
    required this.sender,
    required this.receiver,
  });

  Map<String, dynamic> toMap() {
    return {
      'messageId': messageId,
      'content': content,
      'imageUrl': imageUrl,
      'timestamp': timestamp,
      'sender': sender,
      'receiver': receiver,
    };
  }

  static MessageModel fromMap(Map<String, dynamic> map) {
    return MessageModel(
      messageId: map['messageId'],
      content: map['content'],
      imageUrl: map['imageUrl'],
      timestamp: map['timestamp'],
      sender: map['sender'],
      receiver: map['receiver'],
    );
  }
}
