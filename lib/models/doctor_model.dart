class DoctorsData {
  final String drName;
  final String drRole;
  final String drImage;

  DoctorsData({
    required this.drName,
    required this.drRole,
    required this.drImage,
  });
}

DoctorsData dr1 = DoctorsData(
  drName: "بروف. راكان إبراهيم ناظر",
  drRole: "أستاذ وإستشاري جراحة القلب",
  drImage: "assets/doctors/doc-1.png",
);
DoctorsData dr2 = DoctorsData(
  drName: "بروف. علي مفرح البراتي",
  drRole: "استشاري تأهيل القلب و الجهاز التنفسي",
  drImage: "assets/doctors/doc.jpg",
);

List<DoctorsData> doctors = [dr1, dr2];
