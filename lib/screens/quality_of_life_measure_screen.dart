import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/next_test_screen.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/pop_multiple_pages.dart';
import 'package:makeny/widgets/switch_widget.dart';

class QualityOfLifeMeasureScreen extends StatelessWidget {
  const QualityOfLifeMeasureScreen({
    super.key,
    this.testNumber = 1,
    this.checkBoxMission = false,
  });
  final int testNumber;
  final bool checkBoxMission;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: defaultAppbar(
          context,
          title: tr("consultation_tests.quality_of_life.title"),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Stack(
            children: [
              ListView(
                children: [
                  Padding(
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
                                text: "${tr("test")} $testNumber/6"),
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
                                value: (testNumber / 6),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  switchQualityOfLifePage(testNumber),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
              Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: testNumber < 6
                    ? defaultButton(
                        text: tr("continue"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QualityOfLifeMeasureScreen(
                                testNumber: testNumber + 1,
                                checkBoxMission:
                                    checkBoxMission == true ? true : false,
                              ),
                            ),
                          );
                        },
                      )
                    : defaultButton(
                        text: tr("finish"),
                        onTap: () => checkBoxMission
                            ? popMultiplePages(
                                context: context, pagesToPop: 6, data: true)
                            : {
                                popMultiplePages(
                                  context: context,
                                  pagesToPop: 6,
                                ),
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NextTestScreen(
                                      appbar: tr("analyze_your_answers"),
                                      testNumber:
                                          9, // 9 is the number that give me the page i want do not change
                                    ),
                                  ),
                                ),
                              }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
