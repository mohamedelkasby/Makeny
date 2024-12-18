import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makeny/widgets/questions_type/long_one_answer_check.dart';

Widget thirdPage({
  final Function(bool)? onTestCompletion,
  final Function(Map<String, dynamic>)? onDataCollected,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: LongOneAnswerCheck(
      questionText: "",
      answers: [
        tr("depressed"),
        tr("anxious"),
        tr("frustrated"),
        tr("angry"),
        tr("scared"),
      ],
      onAnswerSelected: (value) {
        onTestCompletion!.call(true);
        onDataCollected!.call({"feeling_while_breathing": value});
      },
    ),
  );
}
