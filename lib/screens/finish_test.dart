import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/danger_measure_screens/danger_measure_screen.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class FinishTest extends StatelessWidget {
  const FinishTest({
    super.key,
    required this.appbar,
    required this.percent,
  });
  final double percent;
  final appbar;

  @override
  Widget build(BuildContext context) {
    const double size = 190;
    const int duration = 4000;
    double height = MediaQuery.sizeOf(context).height * (1 / 500);
    return Scaffold(
      appBar: defaultAppbar(context, title: appbar),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: height,
                  ),
                  CircularPercentIndicator(
                    startAngle: 60,
                    radius: 100,
                    lineWidth: 18,
                    percent: percent,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TweenAnimationBuilder<double>(
                          tween: Tween<double>(begin: 0, end: percent),
                          duration: Duration(milliseconds: duration),
                          builder: (context, value, child) {
                            return Text(
                              "${(value * 100).toInt()}%",
                              style: TextStyle(
                                fontSize: size / 5,
                                fontWeight: FontWeight.w600,
                                color: mainBlack,
                                fontFamily: "cairo",
                              ),
                            );
                          },
                        ),
                        Text(
                          "نسبة الخطورة",
                          style: TextStyle(
                            fontSize: 20,
                            color: greyColor,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    progressColor: mainColor,
                    backgroundColor: Colors.transparent,
                    circularStrokeCap: CircularStrokeCap.round,
                    animation: true,
                    animationDuration: duration,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(text: "اذا كانت نسبة الخطورة بين"),
                        TextSpan(
                          text: " 0 - 40% ",
                          style: TextStyle(
                            color: mainColor,
                          ),
                        ),
                        TextSpan(text: "فلا تحتاج الى اسستشارة من"),
                        TextSpan(
                          text: " 41 - 70% ",
                          style: TextStyle(
                            color: mainColor,
                          ),
                        ),
                        TextSpan(text: "تحتاج الى استشارة من"),
                        TextSpan(
                          text: " 71 - 100% ",
                          style: TextStyle(
                            color: mainColor,
                          ),
                        ),
                        TextSpan(text: "تحتاج الى استشارة مستعجلة"),
                      ],
                      style: TextStyle(
                        color: greyColor.withOpacity(.7),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: "cairo",
                        height: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: defaultButton(
                text: "احجز طبيبك الان",
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DangerMeasureScreen(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
