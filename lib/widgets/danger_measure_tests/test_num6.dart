import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/green_note.dart';

class TestNumber6 extends StatefulWidget {
  final dynamic yesOrNoQuestions;
  final Function(bool)? onTestCompletion;
  final Function(Map<String, dynamic>)? onDataCollected;

  const TestNumber6({
    super.key,
    this.yesOrNoQuestions = const [],
    this.onDataCollected,
    this.onTestCompletion,
  });

  @override
  State<TestNumber6> createState() => _TestNumber6State();
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
            child: greenNote(text: tr("green_note.test_6")),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: defalutQuestionText(
            text: tr("test_6_page.slider_qustion"),
          ),
        ),

        /// the slider Start ...
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              valueIndicatorShape: const RectangularSliderValueIndicatorShape(),
              valueIndicatorTextStyle: const TextStyle(
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
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
                widget.onTestCompletion!.call(true);
                widget.onDataCollected!.call({
                  "slider_value": value,
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
            child: defalutQuestionText(
              text: tr("notice"),
              color: mainColor,
            ),
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: tr("test_6_page.this_scale_from")),
              TextSpan(
                text: " ${tr("test_6_page.zero")} % ",
                style: TextStyle(color: mainColor),
              ),
              TextSpan(text: tr("test_6_page.to")),
              TextSpan(
                text: " 100% ",
                style: TextStyle(color: mainColor),
              ),
              TextSpan(text: tr("test_6_page.where")),
              TextSpan(
                text: " ${tr("test_6_page.zero")} ",
                style: TextStyle(color: mainColor),
              ),
              TextSpan(text: tr("test_6_page.mean_comfortable_but")),
              TextSpan(
                text: " 100 ",
                style: TextStyle(color: mainColor),
              ),
              TextSpan(text: tr("test_6_page.definition_shortness_of_breath")),
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
