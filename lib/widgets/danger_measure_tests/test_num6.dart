import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/danger_measure_screen.dart';

class TestNumber6 extends StatefulWidget {
  final dynamic yesOrNoQuestions;

  const TestNumber6({Key? key, required this.yesOrNoQuestions})
      : super(key: key);

  @override
  _TestNumber6State createState() => _TestNumber6State();
}

class _TestNumber6State extends State<TestNumber6> {
  double sliderValue = 20;

  @override
  Widget build(BuildContext context) {
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

        /// the slider Start ...
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              valueIndicatorShape: RectangularSliderValueIndicatorShape(),
              valueIndicatorTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              valueIndicatorColor: mainColor,
            ),
            child: Slider(
              value: sliderValue,
              activeColor: mainColor,
              min: 0,
              max: 100,
              divisions: 100,
              label: "${(sliderValue).round()}%",
              // autofocus: true,
              // divisions: 5,
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
            ),
          ),
        ),

        /// the slider Start ...

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
        ),
      ],
    );
  }
}

Widget testNumber6Wrapper(context, {required final yesOrNoQuestions}) {
  return TestNumber6(yesOrNoQuestions: yesOrNoQuestions);
}
