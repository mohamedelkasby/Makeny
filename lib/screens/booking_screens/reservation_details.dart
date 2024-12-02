import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/models/doctor_model.dart';
import 'package:makeny/screens/booking_screens/payment_screeen.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/defualt_appbar.dart';

class ReservationDetails extends StatelessWidget {
  const ReservationDetails({
    super.key,
    required this.docSpecialize,
    required this.type,
    required this.date,
    required this.time,
  });
  final String docSpecialize;
  final String type;
  final String date;
  final String time;

  DoctorModel? getDoctorData() {
    // String specialtyName = docSpecialize;
    DoctorModel? model;
    for (var element in doctors) {
      try {
        // print("--${element.specialty}------${docSpecialize}--");

        // print(docSpecialize.contains(element.specialty));

        // print(element.specialty.contains(docSpecialize));

        if (element.specialty.contains(docSpecialize) ||
            docSpecialize.contains(element.specialty)) {
          model = element;
          break;
        }
      } on Exception catch (e) {
        print(e);
      }
    }
    return model;
  }

  @override
  Widget build(BuildContext context) {
    DoctorModel? data = getDoctorData();
    return SafeArea(
      child: Scaffold(
        appBar: defaultAppbar(context, title: tr("booking_details")),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: data != null
              ? Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // first container with the doctor details
                            customContainer(
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: SizedBox(
                                      height: 110,
                                      width: 100,
                                      child: Image.asset(
                                        data.drImage,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      textNormal(text: data.drName),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      textNormal(
                                        text: data.specialty,
                                        textColor: Color(0xff0479D8),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            // second container with the time and reservation details
                            customContainer(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      textNormal(
                                        text: tr("date"),
                                        textColor: greyColor,
                                      ),
                                      SizedBox(height: 10),
                                      textNormal(
                                        text: tr("time"),
                                        textColor: greyColor,
                                      ),
                                      SizedBox(height: 10),
                                      textNormal(
                                        text: tr("consultation_type"),
                                        textColor: greyColor,
                                      ),
                                      SizedBox(height: 10),
                                      textNormal(
                                        text: tr("communication_type"),
                                        textColor: greyColor,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      textNormal(text: date),
                                      SizedBox(height: 10),
                                      textNormal(
                                          text: "$time  ${tr("evening")}"),
                                      SizedBox(height: 10),
                                      textNormal(text: type),
                                      SizedBox(height: 10),
                                      textNormal(text: tr("online")),
                                    ],
                                  )
                                ],
                              ),
                            ),

                            // third container with the price details
                            customContainer(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      textNormal(
                                        text: tr("price"),
                                        textColor: greyColor,
                                      ),
                                      SizedBox(height: 10),
                                      textNormal(
                                        text: tr("value_added_tax"),
                                        textColor: greyColor,
                                      ),
                                      SizedBox(height: 10),
                                      textNormal(
                                        text: tr("total"),
                                        textColor: greyColor,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      textNormal(
                                          text: "150 ${tr("calculates.sar")} "),
                                      SizedBox(height: 10),
                                      textNormal(
                                          text: "10 ${tr("calculates.sar")}"),
                                      SizedBox(height: 10),
                                      textNormal(
                                        text: "160 ${tr("calculates.sar")}",
                                        textColor: mainColor,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    defaultButton(
                        text: tr("confirmation"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentScreeen(
                                date: date,
                                time: time,
                                doctorModel: data,
                              ),
                            ),
                          );
                        }),
                  ],
                )
              // if there is no doctor in this specilize
              : Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textHeaderDescription(
                          text: tr("specialization"), textColor: mainColor400),
                      textHeaderDescription(
                          text: " ${tr("not_available_now")}"),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget customContainer({required child}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            spreadRadius: -1,
            blurRadius: 6,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: child,
    );
  }
}
