import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/danger_measure_screen.dart';

Widget testNumber2(
  context, {
  required final yesOrNoQuestions,
}) {
  return Column(
    // shrinkWrap: true,
    children: [
      YesOrNoQustions(
        questionsText: yesOrNoQuestions,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 15,
          ),
          _defContainer(text: "امراض القلب والاوعية الدموية"),
          _defContainer(text: "امراض الجهاز التنفسي"),
          _defContainer(text: "السرطان"),
          _defContainer(text: "السكري "),
          _defContainer(text: "السمنة"),
          _defContainer(text: "مشاكل صحة الفم"),
          _defContainer(text: "اخري"),
        ],
      ),
    ],
  );
}

Widget _defContainer({
  required String text,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    height: 70,
    decoration: BoxDecoration(
      // color: Colors.green,
      borderRadius: BorderRadius.circular(5),
      border: Border.all(
        color: Color(0xffE8E8E8),
      ),
    ),
    child: Center(
      child: defText(
        text: text,
        color: greyColor,
      ),
    ),
  );
}
