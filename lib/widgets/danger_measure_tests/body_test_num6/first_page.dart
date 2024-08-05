import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';

Widget firstPage() {
  return Column(
    children: [
      _defContainer(text: "يشق عليّ التنفس ويتطلب مني جهدًا عضليًا."),
      _defContainer(
          text:
              "لا أحصل على كمية كافية من الهواء وأشعر بالاختناق أو أشعر بالحاجة إلى الهواء."),
      _defContainer(text: "أشعر بالضيق أو الانقباض في صدري."),
      _defContainer(text: "يتطلب تنفسي جهدًا ذهنيًا أو تركيزًا."),
      _defContainer(text: "أتنفس كثيرًا."),
    ],
  );
}

Widget _defContainer({
  required String text,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5),
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
