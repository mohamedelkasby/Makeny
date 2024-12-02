import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/danger_measure_screens/multidimensional_dyspnea_scale_screen.dart';
import 'package:makeny/screens/next_test_screen.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/internet_connectivity_wrapper.dart';
import 'package:makeny/widgets/switch_widget.dart';

class DangerMeasureScreen extends StatefulWidget {
  DangerMeasureScreen({
    super.key,
    String? appbar, // Make it nullable
    this.testNumber = 1,
    this.shortTest = false,
  }) : appbar = appbar ?? tr("severity_scale"); // Assign default value here

  final String appbar;
  final int testNumber;
  final bool shortTest;

  @override
  State<DangerMeasureScreen> createState() => _DangerMeasureScreenState();
}

class _DangerMeasureScreenState extends State<DangerMeasureScreen> {
  bool allQuestionsAnswered = false;

  List<List<String>> questionsOfPage = [
    /// this case here, the list start with 0 index and i have the
    /// page index start with 1 ,
    [],
    [
      tr("tests.yes_or_no_qustions.test_1.question_number_1"),
    ],
    [
      tr("tests.yes_or_no_qustions.test_2.question_number_1"),
    ],
    [
      tr("tests.yes_or_no_qustions.test_3.question_number_1"),
      tr("tests.yes_or_no_qustions.test_3.question_number_2"),
      tr("tests.yes_or_no_qustions.test_3.question_number_3"),
      tr("tests.yes_or_no_qustions.test_3.question_number_4"),
      tr("tests.yes_or_no_qustions.test_3.question_number_5"),
      tr("tests.yes_or_no_qustions.test_3.question_number_6"),
      tr("tests.yes_or_no_qustions.test_3.question_number_7"),
      tr("tests.yes_or_no_qustions.test_3.question_number_7"),
    ],
    [],
    [],
    [],
    [],
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int testNumber = widget.testNumber;
    final String appbar = widget.appbar;
    final bool shortTest = widget.shortTest;

    // print("Current test number: $testNumber");

    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: defaultAppbar(context, title: appbar),
        body: Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Stack(
            children: [
              ListView(
                children: [
                  /////// the progress indecator Start //////
                  shortTest
                      ? const SizedBox()
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Container(
                            padding: const EdgeInsets.all(
                              2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: greyColor,
                                  offset: const Offset(0, 1),
                                  blurRadius: 10,
                                  spreadRadius: -11,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 8),
                                  child: defalutQuestionText(
                                      text: "${tr("test")} $testNumber/7"),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: LinearProgressIndicator(
                                      color: mainColor,
                                      backgroundColor: mainColor100,
                                      minHeight: 8,
                                      borderRadius: BorderRadius.circular(50),
                                      value: (testNumber / 7),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                  /////// the progress indecator end //////

                  ///switch the body of test ///
                  switchPagesTest(
                    context,
                    testNumber: testNumber,
                    yesOrNoQuestions: questionsOfPage[testNumber],
                  ),

                  /// to make the text under button seen when the scrool end
                  const SizedBox(
                    height: 80,
                  )
                ],
              ),
              Positioned(
                right: 0,
                bottom: 0,
                left: 0,
                child: defaultButton(
                  onTap: () {
                    testNumber == 6
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InternetConnectivityWrapper(
                                child: MultidimensionalDyspneaScaleScreen(
                                  appbar: appbar,
                                ),
                              ),
                            ),
                          )
                        : shortTest
                            ? Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      InternetConnectivityWrapper(
                                    child: NextTestScreen(
                                      appbar: appbar,
                                      testNumber: 9,
                                    ),
                                  ),
                                ),
                              )
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      InternetConnectivityWrapper(
                                    child: NextTestScreen(
                                      appbar:
                                          switchAppbar(testNumber: testNumber),
                                      testNumber: testNumber,
                                    ),
                                  ),
                                ),
                              );
                  },
                  text: tr("continue"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
