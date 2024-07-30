import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/consultation_details.dart';
import 'package:makeny/widgets/consultation_data.dart';
import 'package:makeny/widgets/defualt_appbar.dart';

class UserConsultations extends StatelessWidget {
  const UserConsultations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(context, title: "تفاصيل الاستشارة "),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            consultionsData(
              context,
              img: "assets/doctors/doc.jpg",
              specialty: "جراحة قلب",
              docName: 'بروف.علي الباراتي ',
              status: "مفتوحة",
              statusColor: Color(0xff0EBE7F),
              theScreen: ConsultationDetails(),
            ),
            consultionsData(
              context,
              img: "assets/doctors/doc-1.png",
              specialty: "جراحة قلب",
              docName: 'بروف.راكان ناظر ',
              status: "ملغاه",
              statusColor: mainColor,
              theScreen: ConsultationDetails(),
            ),
          ],
        ),
      ),
    );
  }
}
