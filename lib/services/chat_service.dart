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
  Future<void> sendMessage(String receiverID, String message) async {
    // get current user info
    final String currentUserID = fireAuth.currentUser!.uid;
    final String currentUserEmail = fireAuth.currentUser!.email.toString();
    final Timestamp timeStamp = Timestamp.now();

    MessageModel newMessage = MessageModel(
        senderID: currentUserID,
        senderEmail: currentUserEmail,
        receiverID: receiverID,
        message: message,
        timeStamp: timeStamp);

    // construct a chat id for both users
    List<String> ids = [currentUserEmail, receiverID];
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
  Stream<QuerySnapshot> getMessages(String currentUserID, String receiverID) {
    List<String> ids = [currentUserID, receiverID];
    ids.sort();
    String ChatRoomID = ids.join('_');

    return fireStore
        .collection("ChatRoom")
        .doc(ChatRoomID)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
