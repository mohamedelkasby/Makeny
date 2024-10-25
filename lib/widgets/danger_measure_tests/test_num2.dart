import 'package:flutter/material.dart';
import 'package:makeny/widgets/questions_type/long_one_answer_check.dart';
import 'package:makeny/widgets/questions_type/yes_or_no_question.dart';

class TestNumber2 extends StatefulWidget {
  final List<String> yesOrNoQuestions;

  const TestNumber2({Key? key, required this.yesOrNoQuestions})
      : super(key: key);

  @override
  State<TestNumber2> createState() => _TestNumber2State();
}

class _TestNumber2State extends State<TestNumber2> {
  bool showConditions = false;
  bool allQuestionsAnswered = false;

  void updateShowConditions(List<int?> answers) {
    setState(() {
      // Check if the first question is answered with "Yes" (index 0)
      // and asnwers[0] refers to the first question .
      showConditions = answers.isNotEmpty && answers[0] == 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YesOrNoQuestions(
          questionsText: widget.yesOrNoQuestions,
          onAnswersChanged: updateShowConditions,
          onAllQuestionsAnswered: (allAnswered) {
            setState(() {
              allQuestionsAnswered = allAnswered;
            });
          },
        ),
        if (showConditions)
          LongOneAnswerCheck(
            questionText: "",
            answers: const [
              "امراض القلب والاوعية الدموية",
              "امراض الجهاز التنفسي",
              "السرطان",
              "السكري ",
              "السمنة",
              "مشاكل صحة الفم",
              "اخري",
            ],
            onAnswerSelected: (_) {},
          )
        else
          const SizedBox(), // Empty SizedBox when conditions should not be shown
      ],
    );
  }
}
