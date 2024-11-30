import 'package:easy_localization/easy_localization.dart';

class DoctorModel {
  final String drName;
  final String drRoleKey;
  final String specialtyKey;
  final String drImage;
  final String experienceKey;
  final List<String> aboutDrTobicsKey;
  final String email;

  DoctorModel({
    required this.drName,
    required this.drRoleKey,
    required this.specialtyKey,
    required this.drImage,
    required this.experienceKey,
    required this.aboutDrTobicsKey,
    required this.email,
  });

  String get drRole => tr(drRoleKey);
  String get specialty => tr(specialtyKey);
  String get experience => "$experienceKey ${tr("years")}";
  List<String> get aboutDrTobics =>
      aboutDrTobicsKey.map((key) => tr(key)).toList();
}

DoctorModel dr1 = DoctorModel(
  drName: "بروف. راكان إبراهيم ناظر",
  drRoleKey: "professor_and_consultant_cardiac_surgeon",
  specialtyKey: "heart_surgery",
  drImage: "assets/doctors/doc-1.png",
  experienceKey: "5",
  email: "mohamed@gmail.com",
  aboutDrTobicsKey: [
    "doctor.doc_1.about_1",
    "doctor.doc_1.about_2",
  ],
);
DoctorModel dr2 = DoctorModel(
  drName: "بروف. علي مفرح البراتي",
  drRoleKey: "cardiac_and_respiratory_rehabilitation_consultant",
  specialtyKey: "cardiac_rehabilitation",
  drImage: "assets/doctors/doc.jpg",
  experienceKey: "5",
  email: "medoo@gmail.com",
  aboutDrTobicsKey: [
    "doctor.doc_2.about_1",
  ],
);

List<DoctorModel> doctors = [dr1, dr2];
