class DoctorsData {
  final String drName;
  final String drRole;
  final String drImage;
  final String experience;
  final List<String> aboutDrTobics;
  final int name;

  DoctorsData({
    required this.drName,
    required this.drRole,
    required this.drImage,
    required this.experience,
    required this.aboutDrTobics,
    this.name = 21,
  });
}

DoctorsData dr1 = DoctorsData(
  drName: "بروف. راكان إبراهيم ناظر",
  drRole: "أستاذ وإستشاري جراحة القلب",
  drImage: "assets/doctors/doc-1.png",
  experience: "5 سنوات",
  aboutDrTobics: [
    "مخترع و بروفيسور واستشاري جراحة القلب و الصدر و أحد رواد جراحة القلب في المملكة.",
    "متخصص في جراحات القلب المعقدة و عالية الخطورة. كذلك جراحات تبديل الصمامات و تحوير الشرايين التاجية للقلب و عمليات الإنسلاخ و تمدد الشريان الأورطي.",
  ],
);
DoctorsData dr2 = DoctorsData(
  drName: "بروف. علي مفرح البراتي",
  drRole: "استشاري تأهيل القلب و الجهاز التنفسي",
  drImage: "assets/doctors/doc.jpg",
  experience: "5 سنوات",
  aboutDrTobics: [
    "أستاذ و استشاري تأهيل القلب و الجهاز التنفسي مهتم بتأهيل القلب بعد العمليات الجراحية، الذبحة الصدرية و ضعف عضلة القلب و كذلك الحالات بعد زراعة الأجهزة المساعدة للقلب. كذلك المرضي الذين يشتكون من أمراض الجهاز التنفسي المزمنة و زراعة الرئة و حالات كورونا المزمنة و ما بعد العناية المركزة."
  ],
);

List<DoctorsData> doctors = [dr1, dr2];
