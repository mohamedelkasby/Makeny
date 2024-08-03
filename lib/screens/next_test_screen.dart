import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/danger_measure_screen.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/switch_widget.dart';

class NextTestScreen extends StatefulWidget {
  NextTestScreen({
    super.key,
    required this.appbar,
    required this.testNumber,
    required this.progress,
  });

  final String appbar;
  int testNumber;
  double progress;

  @override
  State<NextTestScreen> createState() => _NextTestScreenState();
}

class _NextTestScreenState extends State<NextTestScreen> {
  @override
  void initState() {
    // increment();
    decrement();
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DangerMeasureScreen(
            appbar: widget.appbar,
            progress: widget.progress < 1.0
                ? widget.progress + (1 / 7)
                : widget.progress,
            testNumber: widget.testNumber < 7
                ? widget.testNumber + 1
                : widget.testNumber,
            // yesOrNoQuestions: questionsOfPage[widget.testNumber],
          ),
        ),
      ),
    );
    super.initState();
  }

  void decrement() {
    widget.progress -= (1 / 7);
    widget.testNumber--;
  }

  void increment() {
    widget.progress += (1 / 7);
    if (widget.progress > 1.0) widget.progress = 1.0;
    widget.testNumber++;
    if (widget.testNumber > 7) widget.testNumber = 7;
  }

  @override
  Widget build(BuildContext context) {
    increment();
    return Scaffold(
      appBar: defaultAppbar(context, title: "التالى ..${widget.appbar}"),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            switchNextTest(testNumber: widget.testNumber),

            ///
            Column(children: [
              Text(
                switchNextTestListText(testNumber: widget.testNumber)[0],

                ///
                // "احسنت",
                style: TextStyle(
                  color: mainColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                switchNextTestListText(testNumber: widget.testNumber)[1],

                ///
                style: TextStyle(
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
