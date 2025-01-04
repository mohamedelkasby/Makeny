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

    // Get sender's name
    final senderDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(fireAuth.currentUser!.uid)
        .get();

    final String senderName = senderDoc.data()?["userName"] ?? "user";

    MessageModel newMessage = MessageModel(
      senderID: senderID,
      senderEmail: senderEmail,
      receiverID: receiverID,
      message: message,
      // Use FieldValue.serverTimestamp() directly
      dateTime: FieldValue.serverTimestamp(),
      senderName: senderName,
    );

    // construct a chat id for both users
    List<String> ids = [senderID, receiverID];
    ids.sort();
    String chatRoomID = ids.join('_');

    // add the new message to the firebase
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
