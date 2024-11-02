import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:makeny/models/user_model.dart';

class FireStoreService {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

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

  Future<void> updateDataToFirestore({
    required String userId,
    required UserModel usermodel,
  }) async {
    try {
      await fireStore.collection('users').doc(userId).update({
        "userName": usermodel.name,
        "idNumber": usermodel.idNumber,
        "email": usermodel.email,
        "phoneNumber": usermodel.phoneNumber,
        "birthDate": usermodel.birthDate,
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

  Future<void> updateImage({
    required String userId,
    File? imageFile,
  }) async {
    try {
      String? imageUrl;

      // If there's a new image to upload
      if (imageFile != null) {
        // Create storage reference
        String imagePath = 'users/$userId/profile_image.jpg';
        Reference ref = storage.ref().child(imagePath);

        // Upload image
        await ref.putFile(imageFile);

        // Get download URL
        imageUrl = await ref.getDownloadURL();
      }

      // Update Firestore with all user data including image URL if present
      await fireStore.collection('users').doc(userId).update({
        "profileImage": imageUrl ?? "",
      });
    } catch (error) {
      debugPrint('Error updating image : $error');
      throw error; // Re-throw to handle in UI
    }
  }
}
