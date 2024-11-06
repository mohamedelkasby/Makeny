import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String senderID;
  final String senderEmail;
  final String userName;
  final String receiverID;
  final String message;
  final Timestamp dateTime;

  MessageModel({
    required this.senderID,
    required this.senderEmail,
    required this.userName,
    required this.receiverID,
    required this.message,
    required this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return {
      "senderID": senderID,
      "senderEmail": senderEmail,
      "recevierID": receiverID,
      "message": message,
      "userName": userName,
      "dateTime": dateTime,
    };
  }
}
