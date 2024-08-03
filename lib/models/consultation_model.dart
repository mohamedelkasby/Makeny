class ConsultationModel {
  final String doctorName;
  final String specialization;
  final String doctorImg;
  final String date;
  final String time;
  ConsultationModel({
    required this.date,
    required this.time,
    required this.doctorImg,
    required this.doctorName,
    required this.specialization,
  });
}

ConsultationModel doctor1 = ConsultationModel(
  date: "2024/5/8 ",
  doctorImg: "assets/doctors/doc.jpg",
  doctorName: "بروف .علي البراتي",
  specialization: "استشارة تأهيل القلب",
  time: "9:30 ص",
);
ConsultationModel doctor2 = ConsultationModel(
  date: "2024/5/8 ",
  doctorImg: "assets/doctors/doc-1.png",
  doctorName: "بروف.راكان ناظر  ",
  specialization: "استشارة تأهيل القلب",
  time: "9:30 ص",
);
List<ConsultationModel> docDetalis = [doctor1, doctor2];
