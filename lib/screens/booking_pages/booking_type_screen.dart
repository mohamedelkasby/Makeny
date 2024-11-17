import 'package:flutter/material.dart';
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
  bool allQuestionsAnswered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          defaultAppbar(context, title: "المواعيد المتاحة - استشارة اونلاين"),
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
                  questionsText: const ["نوع الإستشارة"],
                  onAllQuestionsAnswered: (allAnswered) {
                    setState(() {
                      allQuestionsAnswered = allAnswered;
                    });
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                LongOneAnswerCheck(
                  payment: true,
                  questionText: "التخصص",
                  answers: [
                    "امراض وجراحة الفلب",
                    "تأهل القلب",
                    "نمط الحياة الصحى وجودة الحياة",
                  ],
                  onAnswerSelected: (_) {},
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: defaultButton(
                  text: "استمرار",
                  onTap: () {
                    //TODO
                  }),
            )
          ],
        ),
      ),
    );
  }
}
