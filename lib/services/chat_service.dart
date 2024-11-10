import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:makeny/models/message_model.dart';

class ChatService extends ChangeNotifier {
  // instance of authentication
  final FirebaseAuth fireAuth = FirebaseAuth.instance;
  // instance of fireStore
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  // send message to the firestore
  Future<void> sendMessage({
    required String receiverID,
    required String message,
  }) async {
    // get current user info
    final String senderID = fireAuth.currentUser!.uid;
    final String senderEmail = fireAuth.currentUser!.email.toString() ??
        //this if the phone number is working to not throw an error
        fireAuth.currentUser!.phoneNumber.toString();
    final String userName = fireAuth.currentUser!.displayName.toString();

    MessageModel newMessage = MessageModel(
      senderID: senderID,
      senderEmail: senderEmail,
      receiverID: receiverID,
      message: message,
      // Use FieldValue.serverTimestamp() directly
      dateTime: FieldValue.serverTimestamp(),
      userName: userName,
    );

    // construct a chat id for both users
    List<String> ids = [senderID, receiverID];
    ids.sort();
    String chatRoomID = ids.join('_');

    // add the new message to the database
    await fireStore
        .collection("ChatRoom")
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.toMap());
  }

  // get the messages from firestore
  Stream<QuerySnapshot> getMessages({
    required String senderID,
    required String receiverID,
  }) {
    List<String> ids = [senderID, receiverID];
    ids.sort();
    String chatRoomID = ids.join('_');

    return fireStore
        .collection("ChatRoom")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("dateTime", descending: false)
        .snapshots();
  }
}
