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
        appBar: defaultAppbar(context, title: "تفاصيل الحجز"),
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
                                        text: "التاريخ",
                                        textColor: greyColor,
                                      ),
                                      SizedBox(height: 10),
                                      textNormal(
                                        text: "الوقت",
                                        textColor: greyColor,
                                      ),
                                      SizedBox(height: 10),
                                      textNormal(
                                        text: "نوع الاستشارة",
                                        textColor: greyColor,
                                      ),
                                      SizedBox(height: 10),
                                      textNormal(
                                        text: "وسيلة التواصل",
                                        textColor: greyColor,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      textNormal(text: date),
                                      SizedBox(height: 10),
                                      textNormal(text: "$time  مساءً"),
                                      SizedBox(height: 10),
                                      textNormal(text: type),
                                      SizedBox(height: 10),
                                      textNormal(text: "اتصال عن بعد"),
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
                                        text: "السعر",
                                        textColor: greyColor,
                                      ),
                                      SizedBox(height: 10),
                                      textNormal(
                                        text: "قيمة الضريبة المضافة",
                                        textColor: greyColor,
                                      ),
                                      SizedBox(height: 10),
                                      textNormal(
                                        text: "المجموع الكلى",
                                        textColor: greyColor,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      textNormal(text: "150 ر.س "),
                                      SizedBox(height: 10),
                                      textNormal(text: "10 ر.س"),
                                      SizedBox(height: 10),
                                      textNormal(
                                        text: "160 ر.س",
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
                        text: "تأكيد",
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
                          text: "التخصص", textColor: mainColor400),
                      textHeaderDescription(text: " غير موجود حالياً"),
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
