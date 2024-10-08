import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/slider_widget.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({
    super.key,
    this.selectedText = "",
  });
  final selectedText;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  double sliderValue = 0;
  void initState() {
    sliderValue = 20;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          height: 70,
          decoration: BoxDecoration(
            color: mainColor50.withOpacity(.4),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: mainColor,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: defalutQuestionText(
                text: widget.selectedText,
                color: mainColor,
                align: TextAlign.center,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: SliderWidget(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Align(
            alignment: Alignment.centerRight,
            child: defalutQuestionText(
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
                text: " صفر  ",
                style: TextStyle(color: mainColor),
              ),
              TextSpan(text: "الي"),
              TextSpan(
                text: " 10 ",
                style: TextStyle(color: mainColor),
              ),
              TextSpan(text: "حيث"),
              TextSpan(
                text: " صفر ",
                style: TextStyle(color: mainColor),
              ),
              TextSpan(text: "تعني مرتاح ام"),
              TextSpan(
                text: " 10 ",
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
