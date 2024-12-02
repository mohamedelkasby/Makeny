import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/booking_screens/booking_type_screen.dart';
import 'package:makeny/screens/danger_measure_screens/danger_measure_screen.dart';
import 'package:makeny/screens/finish_test.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/internet_connectivity_wrapper.dart';
import 'package:makeny/widgets/switch_widget.dart';

class NextTestScreen extends StatefulWidget {
  const NextTestScreen({
    super.key,
    required this.appbar,
    required this.testNumber,
    // required this.progress,
  });

  final String appbar;
  final int testNumber;
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
      const Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => testNumber == 9
              ? InternetConnectivityWrapper(
                  child: FinishTest(
                    appbar: appbar == tr("analyze_your_answers")
                        ? tr("test_result")
                        : tr("severity_test"),
                    percent: .85,
                  ),
                )
              : testNumber == 7
                  ? const InternetConnectivityWrapper(
                      child: BookingTypeScreen(),
                    )
                  : InternetConnectivityWrapper(
                      child: DangerMeasureScreen(
                        appbar: appbar,
                        testNumber:
                            testNumber < 7 ? testNumber + 1 : testNumber,
                      ),
                    ),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: defaultAppbar(
        context,
        title: testNumber == 9 ? appbar : "${tr("next")} ..$appbar",
        backarrow: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              switchNextTest(testNumber: testNumber),

              ///
              Column(children: [
                Text(
                  switchNextTestListText(testNumber: testNumber)[0],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  switchNextTestListText(testNumber: testNumber)[1],
                  maxLines: 2,

                  ///
                  style: testNumber == 9
                      ? const TextStyle(
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
      ),
    );
  }
}
