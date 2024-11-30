import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:makeny/widgets/questions_type/long_one_answer_check.dart';

Widget testNumber4(
  context, {
  final yesOrNoQuestions = const [],
}) {
  // shrinkWrap: true,
  return LongOneAnswerCheck(
    questionText: tr("test_4_page.choose_qustions.question_1"),
    answers: [
      tr("test_4_page.choose_qustions.answers_1.num_1"),
      tr("test_4_page.choose_qustions.answers_1.num_2"),
      tr("test_4_page.choose_qustions.answers_1.num_3"),
      tr("test_4_page.choose_qustions.answers_1.num_4"),
      tr("test_4_page.choose_qustions.answers_1.num_5"),
    ],
    onAnswerSelected: (_) {},
  );
}
