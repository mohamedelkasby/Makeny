import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/models/doctor_model.dart';
import 'package:makeny/services/fire_store_service.dart';
import 'package:makeny/widgets/consultation_data.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/defualt_appbar.dart';

class UserConsultations extends StatelessWidget {
  UserConsultations({super.key});

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  DoctorModel findModel(String doctorEmail) {
    late DoctorModel model;
    for (var element in doctors) {
      if (element.email == doctorEmail) {
        model = element;
        break;
      }
    }
    return model;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: defaultAppbar(context, title: tr("consultation_details")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: StreamBuilder(
            stream: FireStoreService().getConsultationData(
              userID: firebaseAuth.currentUser!.uid,
            ),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      textHeaderDescription(text: tr("there_is_no")),
                      textHeaderDescription(
                          text: " ${tr("consultations")} ",
                          textColor: mainColor),
                      textHeaderDescription(text: tr("currently")),
                    ],
                  ),
                );
              }

              final consultations = snapshot.data!.docs;

              return ListView.builder(
                itemCount: consultations.length,
                padding: const EdgeInsets.only(bottom: 16),
                itemBuilder: (context, index) {
                  final document = consultations[index];
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;

                  final DoctorModel doctorModel =
                      findModel(data["doctorEmail"]);
                  // print(document.id);
                  return consultionsData(
                    context,
                    doctorModel: doctorModel,
                    date: data["dateReserved"],
                    time: data["timeReserved"],
                    status: tr(data[
                        "status"]), // this take the key from the database and convert it
                    // why this not accepting to be list <bool> ???
                    patientTests: data["required_tests"] ?? [],
                    consultationId: document.id,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
