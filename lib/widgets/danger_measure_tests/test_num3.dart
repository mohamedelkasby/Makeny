import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/questions_type/yes_or_no_question.dart';

Widget testNumber3(
  context, {
  required final yesOrNoQuestions,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      YesOrNoQuestions(
        questionsText: yesOrNoQuestions,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        child: Align(
          alignment: Alignment.topRight,
          child: defalutQuestionText(
            text: "ما هي الادوية التي تستخدمها حاليا ؟",
          ),
        ),
      ),
      Container(
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: mainColor,
            )),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 40,
              ),
              child: defalutQuestionText(
                text: "مثل : الكورتيزول",
                color: greyColor,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: mainColor200,
                  // style: BorderStyle.solid,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: defalutQuestionText(
                    text: "ارفع صورة او ملف هنا",
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ],
  );
}
