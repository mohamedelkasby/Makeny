import 'package:flutter/material.dart';
import 'package:makeny/screens/danger_measure_screen.dart';
import 'package:makeny/widgets/custom_list_field.dart';

Widget testNumber1(
  context, {
  required final yesOrNoQuestions,
}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xffD0FFBF)),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 10,
            ),
            child: defText(
              text: "الرجاء اجابة الاختبارات التالية لتحديد انسب الاطباء لك..",
            ),
          ),
        ),
      ),
      YesOrNoQustions(
        questionsText: yesOrNoQuestions,
      ),
      CustomListField(
        suffixList: ["سم", "انش"],
        qustionText: "الطول",
      ),
      CustomListField(
        suffixList: ["كجم", "جم"],
        qustionText: "الوزن",
      ),
      CustomListField(
        suffixList: ["كجم/م2", "جم/م2"],
        qustionText: "كتلة الجسم",
        enable: false,
      ),
      CustomListField(
        suffixList: ["سم", "انش"],
        qustionText: "الخصر",
      ),
      CustomListField(
        suffixList: ["سم", "انش"],
        qustionText: "محيط الرقبة",
      ),
      CustomListField(
        suffixText: "نبضة كل دقيقة",
        qustionText: "النبض",
        hintText: "100/60",
      ),
      CustomListField(
        qustionText: "مستوى الاكسحين",
        hintText: "100/90",
      ),
      CustomListField(
        qustionText: "ضغط الدم الانقباضى",
        hintText: "140/100",
        suffixList: ["ملم زئبقي"],
      ),
      CustomListField(
        qustionText: "ضغط الدم الانبساطى",
        hintText: "80/60",
        suffixList: ["ملم زئبقي"],
      ),
      CustomListField(
        qustionText: "الكلسترول",
        hintText: "5.2/0",
      ),
      CustomListField(
        qustionText: "الدهون الثلاثية النافعة",
        hintText: "0",
        suffixList: ["سم"],
      ),
    ],
  );
}
