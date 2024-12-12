import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:makeny/cubits/cubit.dart';
import 'package:makeny/models/doctor_model.dart';
import 'package:makeny/screens/consultation_screens/consultation_details.dart';
import 'package:makeny/services/fire_store_service.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/defualt_appbar.dart';

class SuccessPayment extends StatelessWidget {
  SuccessPayment({
    super.key,
    required this.date,
    required this.time,
    required this.doctorModel,
  });
  final String date;
  final String time;
  final DoctorModel doctorModel;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffF4FBFF),
          appBar: defaultAppbar(context,
              title: tr("booking_completed_successfully")),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Column(
              children: [
                Expanded(
                    child: Center(
                  child: Container(
                    child: Image.asset("assets/success payment.png"),
                  ),
                )),
                defaultButton(
                    text: tr("go_to_consultation"),
                    onTap: () {
                      FireStoreService().addConsultationToUser(
                        userId: firebaseAuth.currentUser!.uid,
                        date: date,
                        time: time,
                        doctorModel: doctorModel,
                        status: tr("opened"),
                      );
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      AppCubit.get(context).selectedBNBIndex = 0;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConsultationDetails(
                              doctorModel: doctorModel,
                              date: date,
                              time: time,
                              status: tr("opened"),
                              requiredTests: const [],
                            ),
                          ));
                    })
              ],
            ),
          )),
    );
  }
}
