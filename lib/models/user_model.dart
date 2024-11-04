import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? userId;
  final String? picture;
  final String? name;
  final Timestamp? birthDate;
  final String? gender;
  final String? email;
  final String? phoneNumber;
  final int? idNumber;
  final String? educationLevel;
  final String? currentJob;
  final double? length;
  final double? weight;
  final double? waist;
  final String? vision;
  final String? maritalStatus;
  final bool? isUser;

  UserModel({
    this.name,
    this.userId,
    this.birthDate,
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
    this.isUser,
  });

  // The 'fromFirebase' constructor should focus on available fields from Firebase User
  factory UserModel.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    // final data = doc.data()!;

    return UserModel(
      userId: doc.id,
      email: doc["email"] ?? '',
      name: doc["userName"] ?? '',
      birthDate: doc["birthDate"] ?? '',
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
      isUser: doc["isUser"],
    );
  }

  factory UserModel.empty() {
    return UserModel(
      userId: '',
      email: '',
      name: '',
      maritalStatus: '',
      birthDate: Timestamp.fromDate(DateTime.now()),
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
      isUser: false,
    );
  }
}
