import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/danger_measure_screen.dart';

Widget testNumber6(
  context, {
  required final yesOrNoQuestions,
}) {
  double sliderValue = .2;
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
              text:
                  "يهدف هذا المقياس إلى مساعدتنا لفهم كيف تشعر بتنفسك. لا توجد إجابة صحيحة أو إجابة خاطئة، نريد منك أن تزودنا بالمعلومات المرتبطة بتنفسك.",
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: defText(
            text:
                "ما مدي عدم الراحة او الضيق الذي تشعر به خلال تنفسك وما مدي سوء تنفسك ؟"),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Slider(
          value: sliderValue,
          activeColor: mainColor,
          label: "${sliderValue * 100}",
          // divisions: 1,
          // secondaryTrackValue: .9,
          allowedInteraction: SliderInteraction.slideThumb,
          onChanged: (value) {
            sliderValue = value;
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Align(
          alignment: Alignment.centerRight,
          child: defText(
            text: "تنوية",
            color: mainColor,
          ),
        ),
      ),
      Text.rich(
        TextSpan(
          children: [
            TextSpan(text: "هذا المقياس من"),
            TextSpan(
              text: " صفر % ",
              style: TextStyle(color: mainColor),
            ),
            TextSpan(text: "الي"),
            TextSpan(
              text: " 100% ",
              style: TextStyle(color: mainColor),
            ),
            TextSpan(text: "حيث"),
            TextSpan(
              text: " صفر ",
              style: TextStyle(color: mainColor),
            ),
            TextSpan(text: "تعني مرتاح ام"),
            TextSpan(
              text: " 100 ",
              style: TextStyle(color: mainColor),
            ),
            TextSpan(text: "تعني انك تشعر بأكبر قدر من الضيق في التنفس"),
          ],
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: mainBlack,
          ),
        ),
      )
    ],
  );
}
