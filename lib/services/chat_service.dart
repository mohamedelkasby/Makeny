import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:makeny/models/message_model.dart';

class ChatService extends ChangeNotifier {
  // instance of authentication
  FirebaseAuth fireAuth = FirebaseAuth.instance;
  //instance of fireStore
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  //send message to the firestore
  Future<void> sendMessage({
    required String receiverID,
    required String message,
  }) async {
    // get current user info
    final String senderID = fireAuth.currentUser!.uid;
    final String senderEmail = fireAuth.currentUser!.email.toString() ??
        fireAuth.currentUser!.phoneNumber.toString();

    final Timestamp timeStamp = Timestamp.now();

    MessageModel newMessage = MessageModel(
      senderID: senderID,
      senderEmail: senderEmail,
      receiverID: receiverID,
      message: message,
      timeStamp: timeStamp,
    );

    // construct a chat id for both users
    List<String> ids = [senderID, receiverID];
    ids.sort();
    String ChatRoomID = ids.join('_');

    //add the new message to the database
    await fireStore
        .collection("ChatRoom")
        .doc(ChatRoomID)
        .collection("messages")
        .add(newMessage.toMap());
  }

  //get the messages from  firestore
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
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
