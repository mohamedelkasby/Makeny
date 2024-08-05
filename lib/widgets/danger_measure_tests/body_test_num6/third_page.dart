import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';

Widget thirdPage() {
  return Column(
    children: [
      _defContainer(text: "مكتئب"),
      _defContainer(text: "قلق"),
      _defContainer(text: "محبط"),
      _defContainer(text: "غاضب"),
      _defContainer(text: "خائف"),
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
