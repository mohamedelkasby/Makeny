import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makeny/widgets/questions_type/long_one_answer_check.dart';
import 'package:makeny/widgets/questions_type/yes_or_no_question.dart';

class TestNumber2 extends StatefulWidget {
  final List<String> yesOrNoQuestions;

  const TestNumber2({super.key, required this.yesOrNoQuestions});

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
            answers: [
              tr("test_2_page.choose_one_answer.answer_1"),
              tr("test_2_page.choose_one_answer.answer_2"),
              tr("test_2_page.choose_one_answer.answer_3"),
              tr("test_2_page.choose_one_answer.answer_4"),
              tr("test_2_page.choose_one_answer.answer_5"),
              tr("test_2_page.choose_one_answer.answer_6"),
              tr("test_2_page.choose_one_answer.answer_7"),
            ],
            onAnswerSelected: (_) {},
          )
        else
          const SizedBox(), // Empty SizedBox when conditions should not be shown
      ],
    );
  }
}
