import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? userId;
  final String? picture;
  final String? name;
  final double? age;
  final String? gender;
  final String? email;
  final String? phoneNumber;
  final double? idNumber;
  final String? educationLevel;
  final String? currentJob;
  final double? length;
  final double? weight;
  final double? waist;
  final String? vision;
  final String? maritalStatus;

  UserModel({
    this.name,
    this.userId,
    this.age,
    this.gender,
    this.email,
    this.phoneNumber,
    this.idNumber,
    this.educationLevel,
    this.currentJob,
    this.length,
    this.weight,
    this.waist,
    this.vision,
    this.picture,
    this.maritalStatus,
  });

  // The 'fromFirebase' constructor should focus on available fields from Firebase User
  factory UserModel.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    // final data = doc.data()!;

    return UserModel(
      userId: doc.id,
      email: doc["email"] ?? '',
      name: doc["userName"] ?? '',
      age: doc["age"] ?? '',
      gender: doc["gender"] ?? '',
      phoneNumber: doc["phoneNumber"] ?? '',
      idNumber: doc["idNumber"] ?? '',
      educationLevel: doc["educationLevel"] ?? '',
      currentJob: doc["currentJob"] ?? '',
      length: doc["length"] ?? '',
      weight: doc["weight"] ?? '',
      waist: doc["waist"] ?? '',
      vision: doc["vision"] ?? '',
      picture: doc["picture"] ?? '',
      maritalStatus: doc["maritalStatus"] ?? '',
    );
  }

  /// to store in the firestore
  Map<String, dynamic> toDocument() {
    return {
      "userId": userId,
      "email": email,
      "name": name,
      "age": age,
      "gender": gender,
      "phoneNumber": phoneNumber,
      "idNumber": idNumber,
      "educationLevel": educationLevel,
      "currentJob": currentJob,
      "length": length,
      "weight": weight,
      "waist": waist,
      "vision": vision,
      "picture": picture,
      "maritalStatus": maritalStatus,
    };
  }

  factory UserModel.empty() {
    return UserModel(
      userId: '',
      email: '',
      name: '',
      maritalStatus: '',
      age: 0,
      gender: '',
      phoneNumber: '',
      idNumber: 0,
      educationLevel: '',
      currentJob: '',
      length: 0,
      weight: 0,
      waist: 0,
      vision: '',
      picture: '',
    );
  }
}
