import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:makeny/models/doctor_model.dart';
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

  Future<void> addTestAnswers({
    required String userId,
    int? testNumber,
    String? testName = "-------",
    required Map<String, dynamic> testData,
    int? subtest,
  }) async {
    try {
      await fireStore
          .collection('users')
          .doc(userId)
          .collection("tests")
          .doc(testNumber == null
              ? testName
              : "test_number_$testNumber${subtest == null ? "" : "_subtest_$subtest"}")
          .set({
        ...testData,
        "testTime": FieldValue.serverTimestamp(),
      });
    } catch (error) {
      debugPrint('Error saving test data: $error');
    }
  }

  Future<void> addConsultationToUser({
    required String userId,
    required String date,
    required String time,
    required DoctorModel doctorModel,
  }) async {
    try {
      await fireStore
          .collection('users')
          .doc(userId)
          .collection("consultations")
          .add({
        "doctorEmail": doctorModel.email,
        "dateReserved": date,
        "timeReserved": time,
      });
    } catch (error) {
      debugPrint('Error add the consultation data: $error');
    }
  }

  Stream<QuerySnapshot> getConsultationDate({required String userID}) {
    try {
      return fireStore
          .collection("users")
          .doc(userID)
          .collection("consultations")
          .orderBy("dateReserved", descending: false)
          .snapshots();
    } catch (e) {
      throw Exception("userConsultarions not found");
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

  Future<void> updateDataFromTest1({
    required String userId,
    required UserModel usermodel,
  }) async {
    try {
      await fireStore.collection('users').doc(userId).update({
        "length": usermodel.length,
        "weight": usermodel.weight,
        "waist": usermodel.waist,
        // "vision": usermodel.vision,
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

  Future<DocumentSnapshot?> getUserDataByEmail(String email) async {
    try {
      // Access the Firestore instance
      final firestore = FirebaseFirestore.instance;

      // Query the collection based on email field
      QuerySnapshot querySnapshot = await firestore
          .collection(
              'users') // replace 'users' with the actual collection name
          .where('email', isEqualTo: email)
          .limit(1) // limit to one document to avoid multiple matches
          .get();

      // Check if any documents were found
      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first;
      } else {
        print('No user found with that email.');
        return null;
      }
    } catch (e) {
      print('Error getting user data: $e');
      return null;
    }
  }
}
