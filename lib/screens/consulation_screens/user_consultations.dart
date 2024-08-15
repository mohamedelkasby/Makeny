import 'package:flutter/material.dart';
import 'package:makeny/models/doctor_model.dart';
import 'package:makeny/screens/consulation_screens/consultation_details.dart';
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
              img: dr2.drImage,
              specialty: dr2.specialty,
              docName: dr2.drName,
              status: "مفتوحه",
              // statusColor: Color(0xff0EBE7F),
              theScreen: ConsultationDetails(
                doctorName: dr2.drName,
                // TODO: we can't declare this here change it when create the reservation page
                status: "مفتوحه",
              ),
            ),
            consultionsData(
              context,
              img: dr1.drImage,
              specialty: dr1.specialty,
              docName: dr1.drName,
              status: "مفتوحه",
              // statusColor: mainColor,
              theScreen: ConsultationDetails(
                doctorName: dr1
                    .drName, // TODO: we can't declare this here change it when create the reservation page
                status: "مفتوحه",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
