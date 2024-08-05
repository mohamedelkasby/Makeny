import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 15),
              _defContainer(text: "امراض القلب والاوعية الدموية"),
              _defContainer(text: "امراض الجهاز التنفسي"),
              _defContainer(text: "السرطان"),
              _defContainer(text: "السكري "),
              _defContainer(text: "السمنة"),
              _defContainer(text: "مشاكل صحة الفم"),
              _defContainer(text: "اخري"),
            ],
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
