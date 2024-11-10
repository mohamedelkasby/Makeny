import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String senderID;
  final String senderEmail;
  final String userName;
  final String receiverID;
  final String message;
  final dynamic dateTime;

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

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      senderID: map['senderID'] ?? '',
      senderEmail: map['senderEmail'] ?? '',
      receiverID: map['receiverID'] ?? '',
      message: map['message'] ?? '',
      dateTime: map['dateTime'],
      userName: map['userName'] ?? '',
    );
  }

  // Helper method to get DateTime from Timestamp
  DateTime? getDateTime() {
    if (dateTime is Timestamp) {
      return (dateTime as Timestamp).toDate();
    }
    return null;
  }
}
