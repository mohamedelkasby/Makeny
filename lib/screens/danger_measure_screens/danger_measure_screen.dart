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
  const DangerMeasureScreen({
    super.key,
    this.appbar = "مقياس الخطورة",
    this.testNumber = 1,
    this.shortTest = false,
  });
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
    ["هل تدخن؟"],
    ["هل لديك امراض مزمنة؟"],
    [
      "هل تنومت في المستشفي خلال  الشهر الماضي بسبب القلب؟",
      "هل تعاني من الشخير ؟",
      "هل تعاني من الصداع في الصباح ؟",
      "هل تعاني من جفاف في الحلق عند الاستيقاظ من النوم ؟",
      "هل تعاني من صعوبة في النوم او النعاس دائما ؟",
      "هل تعاني من ضعف في التركيز ؟",
      "هل تعاني من الاختناق الليلي ؟",
      "هل تحتاج اجهزة مساعدة عند النوم ؟",
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

    return Scaffold(
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
                    ? SizedBox()
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
                                    text: "اختبار $testNumber/7"),
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

                /////// the yes or no question ////
                switchPagesTest(
                  context,
                  testNumber: testNumber,
                  yesOrNoQuestions: questionsOfPage[widget.testNumber],
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
                text: 'استمرار',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
