import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makeny/widgets/questions_type/long_one_answer_check.dart';
import 'package:makeny/widgets/questions_type/yes_or_no_question.dart';

class TestNumber2 extends StatefulWidget {
  final List<String> yesOrNoQuestions;
  final Function(bool)? onTestCompletion;
  final Function(Map<String, dynamic>)? onDataCollected;

  const TestNumber2({
    super.key,
    required this.yesOrNoQuestions,
    this.onTestCompletion,
    this.onDataCollected,
  });

  @override
  State<TestNumber2> createState() => _TestNumber2State();
}

class _TestNumber2State extends State<TestNumber2> {
  bool showConditions = false;
  bool yesquestionsAnswered = false;
  bool readyToSubmit = false;
  List<int?> yesNoAnswers = [];
  List<String?> diseases = [];

  void updateShowConditions(List<int?> answers) {
    setState(() {
      // Check if the first question is answered with "Yes" (index 0)
      // and asnwers[0] refers to the first question .
      showConditions = answers[0] == 0;
      checkTestCompletion();
    });
  }

  void checkTestCompletion() {
    // Check if all questions are answered
    if (showConditions == false) {
      widget.onTestCompletion!.call(true);
      // readyToSubmit = true;
      collectData();
      diseases = [];
    } else if (diseases.isNotEmpty && showConditions == true) {
      widget.onTestCompletion!.call(true);
      collectData();
      // readyToSubmit = true;
    } else {
      widget.onTestCompletion!.call(false);
      // readyToSubmit = false;
    }
  }

  void collectData() {
    // if (readyToSubmit) {
    // Collect and send data
    widget.onDataCollected?.call({
      "yesNoQuestions": yesNoAnswers,
      "chronic_diseases": diseases,
    });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YesOrNoQuestions(
          questionsText: widget.yesOrNoQuestions,
          onAnswersChanged: (answers) {
            yesNoAnswers = answers;
            updateShowConditions(answers);
          },
          onAllQuestionsAnswered: (allAnswered) {
            setState(() {
              yesquestionsAnswered = allAnswered;
            });
          },
        ),
        if (showConditions)
          LongOneAnswerCheck(
            oneAnswer: false,
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
            onAnswerSelected: (value) {
              diseases = value;
              checkTestCompletion();
            },
          )
        else
          const SizedBox(), // Empty SizedBox when conditions should not be shown
      ],
    );
  }
}
