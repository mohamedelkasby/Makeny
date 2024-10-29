import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:makeny/models/user_model.dart';

class FireStoreService {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  /// Fetches the details of the current user based on userID.
  Future<UserModel> getUserDetails({required String userID}) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await fireStore.collection("users").doc(userID).get();

      if (snapshot.exists) {
        return UserModel.fromDocument(snapshot);
      } else {
        print("User with ID $userID not found in Firestore.");
        throw Exception("User not found");
      }
    } on FirebaseException catch (e) {
      print("Firebase error fetching user data: ${e.message}");
      rethrow;
    } catch (e) {
      print("Unexpected error fetching user data: $e");
      rethrow;
    }
  }

  Future<void> updateToFirestore({
    required String userId,
    required UserModel usermodel,
  }) async {
    try {
      await fireStore.collection('users').doc(userId).update({
        "userName": usermodel.name,
        "idNumber": usermodel.idNumber,
        "email": usermodel.email,
        "phoneNumber": usermodel.phoneNumber,
        "age": usermodel.age,
        "maritalStatus": usermodel.maritalStatus,
        "gender": usermodel.gender,
        "educationLevel": usermodel.educationLevel,
        "currentJob": usermodel.currentJob,
      });
    } catch (error) {
      // Handle any errors
      debugPrint('Error updating data: $error');
    }
  }
}
