import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_alumnet/model/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatService extends ChangeNotifier {
  // instance of auth and firestore
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  final User? currentUser = FirebaseAuth.instance.currentUser;

  //main METHODS

  // SEND MESSAGES
  Future<void> sendMessage(String receiverId, String message) async {
    //get current user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    // final String currentUserName = await getUsername(currentUserId);
    final Timestamp timestamp = Timestamp.now();

    //create a new message
    Message newMessage = Message(
        senderId: currentUserId,
        // senderUserName: currentUserName,
        senderEmail: currentUserEmail,
        receiverId: receiverId,
        // receiverUserName: receiverUserName,
        message: message,
        timestamp: timestamp);

    //construct chat room id from the current user id and receiver id
    // (sorted to ensure uniqueness)sende
    List<String> ids = [currentUserId, receiverId];
    ids.sort(); // sort the ids to ensure the chat room id is always the same for any pair of people
    String chatRoomId = ids.join(
        "_"); //combine the ids into a simple string to use as a chatroomID

    // add new message to the database
    await _fireStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  // GET MESSAGES
  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    //construct chat room id from user ids (sorted to ensure it matches the id used when sending the message)
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return _fireStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
