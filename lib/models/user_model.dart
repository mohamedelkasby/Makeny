import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String userId;
  final String pic;
  final String name;
  final String age;
  final String gender;
  final String gmail;
  final String phoneNumber;
  final String idNumber;
  final String educationLevel;
  final String currentJob;
  final String length;
  final String weight;
  final String waist;
  final String vision;

  UserModel({
    required this.name,
    required this.userId,
    required this.age,
    required this.gender,
    required this.gmail,
    required this.phoneNumber,
    required this.idNumber,
    required this.educationLevel,
    required this.currentJob,
    required this.length,
    required this.weight,
    required this.waist,
    required this.vision,
    required this.pic,
  });

  // The 'fromFirebase' constructor should focus on available fields from Firebase User
  factory UserModel.fromFirebase(
    UserCredential userCredential, {
    required String age,
    required String name,
    required String email,
    required String gender,
    required String phoneNumber,
    required String idNumber,
    required String educationLevel,
    required String currentJob,
    required String length,
    required String weight,
    required String waist,
    required String vision,
    required String pic,
  }) {
    return UserModel(
      userId: userCredential.user!.uid,
      name: name,
      age: age,
      gender: gender,
      gmail: email,
      phoneNumber: phoneNumber,
      idNumber: idNumber,
      educationLevel: educationLevel,
      currentJob: currentJob,
      length: length,
      weight: weight,
      waist: waist,
      vision: vision,
      pic: pic,
    );
  }
}
