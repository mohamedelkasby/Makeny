import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';

Widget testNumber4(
  context, {
  final yesOrNoQuestions = const [],
}) {
  return Column(
    // shrinkWrap: true,
    children: [
      defalutQuestionText(
        text: "كيف تقيم  تنفسك اثناء الحركة او الجهد البدني او الرياضي ؟",
      ),
      _defContainer(
        text: "ضيق في التنفس عند ممارسة الراضة الشاقة ",
      ),
      _defContainer(
        text: "ضيق في التنفس عند الاسراع علي ارض مستوية او الصعود الي تلة ",
      ),
      _defContainer(
        text: "امشي بشكل ابطأ من الاشخاص في نفس عمري بسبب ضيق التنفقس    ",
      ),
      _defContainer(
        text:
            "اتوقف لاتنفس عند المشي لمسافة حوالي 100 منر او بعد عدة دقائق من السير علي ارض مستوية",
      ),
      _defContainer(
        text:
            "اشعر بضيق في التنفس لدرجة عدم قدرتي علي الخروج من المنزل او اقتناء الملابس",
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
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: defalutQuestionText(
          text: text,
          color: greyColor,
          align: TextAlign.center,
        ),
      ),
    ),
  );
}
