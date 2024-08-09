import 'package:flutter/material.dart';

import 'package:makeny/widgets/questions_type/long_one_answer_check.dart';

Widget testNumber4(
  context, {
  final yesOrNoQuestions = const [],
}) {
  // shrinkWrap: true,
  return LongOneAnswerCheck(
    questionText: "كيف تقيم  تنفسك اثناء الحركة او الجهد البدني او الرياضي ؟",
    answers: [
      "ضيق في التنفس عند ممارسة الراضة الشاقة ",
      "ضيق في التنفس عند الاسراع علي ارض مستوية او الصعود الي تلة ",
      "امشي بشكل ابطأ من الاشخاص في نفس عمري بسبب ضيق التنفقس    ",
      "اتوقف لاتنفس عند المشي لمسافة حوالي 100 منر او بعد عدة دقائق من السير علي ارض مستوية",
      "اشعر بضيق في التنفس لدرجة عدم قدرتي علي الخروج من المنزل او اقتناء الملابس",
    ],
    onAnswerSelected: (_) {},
  );
}
