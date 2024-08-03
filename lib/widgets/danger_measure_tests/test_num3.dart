import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/danger_measure_screen.dart';

Widget testNumber3(
  context, {
  required final yesOrNoQuestions,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      YesOrNoQustions(
        questionsText: yesOrNoQuestions,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        child: Align(
          alignment: Alignment.topRight,
          child: defText(
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
              child: defText(
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
                  child: defText(
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
