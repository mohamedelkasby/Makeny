import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/models/doctor_model.dart';
import 'package:makeny/screens/consultation_screens/consultation_details.dart';
import 'package:makeny/widgets/internet_connectivity_wrapper.dart';

Widget consultionsData(
  context, {
  required DoctorModel doctorModel,
  required String date,
  required String time,
  required String status,
  required String consultationId,
  required List<dynamic> patientTests,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InternetConnectivityWrapper(
                child: ConsultationDetails(
                  doctorModel: doctorModel,
                  date: date,
                  time: time,
                  status: status,
                  requiredTests: patientTests,
                  consultationId: consultationId,
                ),
              ),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffF3FAFF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    doctorModel.drImage,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        doctorModel.specialty,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorModel.drName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/clock.svg"),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "$time ${tr("calculates.pm")}",
                        style: const TextStyle(
                          color: Color(0xff6C7380),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/deta.svg"),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        date,
                        style: const TextStyle(
                          color: Color(0xff6C7380),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: status == tr("canceled")
                              ? mainColor
                              : const Color(0xff0EBE7F),
                        ),
                        child: const SizedBox(
                          width: 10,
                          height: 10,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        status,
                        style: const TextStyle(
                          color: Color(0xff6C7380),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
