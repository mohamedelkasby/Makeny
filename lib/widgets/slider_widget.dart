import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double sliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
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
        onChanged: (value) {
          setState(() {
            sliderValue = value;
          });
        },
      ),
    );
  }
}
