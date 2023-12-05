import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderEmail;
  // final String senderUserName;
  final String receiverId;
  // final String receiverUserName;
  final String message;
  final Timestamp timestamp;

  Message(
      {required this.senderId,
      required this.senderEmail,
      // required this.senderUserName,
      required this.message,
      required this.receiverId,
      // required this.receiverUserName,
      required this.timestamp});

  //convert to Map
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      // 'senderUserName': senderUserName,
      'receiverId': receiverId,
      // 'receiverUserName': receiverUserName,
      'message': message,
      'timestamp': timestamp,
    };
  }
}
