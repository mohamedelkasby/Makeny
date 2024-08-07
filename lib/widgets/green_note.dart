import 'package:flutter/material.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';

Widget greenNote({
  required final String text,
  final String headerText = "",
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 15,
      horizontal: 10,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headerText == ""
            ? SizedBox()
            : Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: defalutQuestionText(
                  text: headerText,
                  weight: FontWeight.w900,
                ),
              ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xffD0FFBF)),
          child: defalutQuestionText(
            text: text,
          ),
        ),
      ],
    ),
  );
}
