import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/questions_type/long_one_answer_check.dart';
import 'package:makeny/widgets/questions_type/yes_or_no_question.dart';

class TestNumber2 extends StatefulWidget {
  final List<String> yesOrNoQuestions;

  const TestNumber2({Key? key, required this.yesOrNoQuestions})
      : super(key: key);

  @override
  _TestNumber2State createState() => _TestNumber2State();
}

class _TestNumber2State extends State<TestNumber2> {
  bool showConditions = false;

  void updateShowConditions(List<int?> answers) {
    setState(() {
      // Check if the first question is answered with "Yes" (index 0)
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
        ),
        if (showConditions)
          LongOneAnswerCheck(
            questionText: "",
            answers: [
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
          SizedBox(), // Empty SizedBox when conditions should not be shown
      ],
    );
  }

  Widget _defContainer({required String text}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Color(0xffE8E8E8),
        ),
      ),
      child: Center(
        child: defalutQuestionText(
          text: text,
          color: greyColor,
        ),
      ),
    );
  }
}
