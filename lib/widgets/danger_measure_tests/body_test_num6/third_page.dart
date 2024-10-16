import 'package:flutter/material.dart';
import 'package:makeny/widgets/questions_type/long_one_answer_check.dart';

Widget thirdPage() {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: LongOneAnswerCheck(
      questionText: "",
      answers: [
        "مكتئب",
        "قلق",
        "محبط",
        "غاضب",
        "خائف",
      ],
      onAnswerSelected: (_) {},
    ),
  );
}
