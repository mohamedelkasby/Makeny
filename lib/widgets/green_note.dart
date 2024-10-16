import 'package:flutter/material.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';

Widget greenNote({
  required final String text,
  final String headerText = "",
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xffD0FFBF)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerText == ""
                ? SizedBox()
                : Padding(
                    padding: const EdgeInsets.fromLTRB(10, 12, 10, 0),
                    child: defalutQuestionText(
                      text: headerText,
                      weight: FontWeight.w900,
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 10,
              ),
              child: defalutQuestionText(
                text: text,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
