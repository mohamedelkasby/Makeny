import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makeny/screens/booking_screens/booking_date_screen.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/questions_type/long_one_answer_check.dart';
import 'package:makeny/widgets/questions_type/yes_or_no_question.dart';

class BookingTypeScreen extends StatefulWidget {
  const BookingTypeScreen({super.key});

  @override
  State<BookingTypeScreen> createState() => _BookingTypeScreenState();
}

class _BookingTypeScreenState extends State<BookingTypeScreen> {
  String? consultationType = null;
  String? specialization = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(context,
          title: tr("available_appointments_online_consultation")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                YesOrNoQuestions(
                  payment: true,
                  questionsText: [tr("consultation_type")],
                  onAllQuestionsAnswered: (_) {},
                  onAnswersChanged: (type) {
                    setState(() {
                      consultationType =
                          type.first == 0 ? tr("normal") : tr("urgent");
                    });
                    print(consultationType);
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                LongOneAnswerCheck(
                  payment: true,
                  questionText: tr("specialization"),
                  answers: [
                    tr("heart_diseases_and_surgery"),
                    tr("cardiac_rehabilitation"),
                    tr("healthy_lifestyle_and_quality_life"),
                  ],
                  onAnswerSelected: (value) {
                    //TODO
                    setState(() {
                      specialization = value.first;
                    });
                    print(specialization);
                  },
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: defaultButton(
                  text: tr("continue"),
                  onTap: (specialization == null || consultationType == null)
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingDateScreen(
                                docSpecialize: specialization!,
                                type: consultationType!,
                              ),
                            ),
                          );
                        }),
            )
          ],
        ),
      ),
    );
  }
}
