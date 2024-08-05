import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/danger_measure_screens/danger_measure_screen.dart';
import 'package:makeny/screens/finish_test.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/switch_widget.dart';

class NextTestScreen extends StatefulWidget {
  NextTestScreen({
    super.key,
    required this.appbar,
    required this.testNumber,
    // required this.progress,
  });

  final String appbar;
  int testNumber;
  // double progress;

  @override
  State<NextTestScreen> createState() => _NextTestScreenState();
}

class _NextTestScreenState extends State<NextTestScreen> {
  late int testNumber = widget.testNumber;
  late String appbar = widget.appbar;
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => testNumber == 9
              ? FinishTest(
                  appbar: "اختبار مدي الخطورة",
                  percent: .85,
                )
              : DangerMeasureScreen(
                  appbar: appbar,
                  testNumber: testNumber < 7 ? testNumber + 1 : testNumber,
                ),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(context,
          title: testNumber == 9 ? appbar : "التالى ..$appbar"),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            switchNextTest(testNumber: testNumber),

            ///
            Column(children: [
              Text(
                switchNextTestListText(testNumber: testNumber)[0],
                style: TextStyle(
                  color: mainColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                switchNextTestListText(testNumber: testNumber)[1],

                ///
                style: testNumber == 9
                    ? TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      )
                    : TextStyle(
                        fontSize: 15,
                        color: mainBlack,
                      ),
              ),
            ]),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .20,
            )
          ],
        ),
      ),
    );
  }
}
