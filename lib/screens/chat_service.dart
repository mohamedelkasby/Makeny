import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  /// get  instauce of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// get user stream
  /*
  
    Stream<List<Map<String , dynamic>>> = 
    [
     {
    'email' = talaa@examble.com
    'id' = ..
    },
    
    {
    'email' = talaa@examble.com
    'id' = ..
    },
    ]

   */
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("User").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        // return user
        return user;
      }).toList();
    });
  }

  /// send message

  /// get message
}
