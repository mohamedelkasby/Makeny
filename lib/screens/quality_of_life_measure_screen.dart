import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/next_test_screen.dart';
import 'package:makeny/services/fire_store_service.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/pop_multiple_pages.dart';
import 'package:makeny/widgets/switch_widget.dart';

class QualityOfLifeMeasureScreen extends StatefulWidget {
  const QualityOfLifeMeasureScreen({
    super.key,
    this.testNumber = 1,
    this.checkBoxMission = false,
  });
  final int testNumber;
  final bool checkBoxMission;

  @override
  State<QualityOfLifeMeasureScreen> createState() =>
      _QualityOfLifeMeasureScreenState();
}

List<Map<String, dynamic>> qualityOfLifeTest = [];

class _QualityOfLifeMeasureScreenState
    extends State<QualityOfLifeMeasureScreen> {
  Map<int, bool> testsCompletionStatus = {
    1: false,
    2: false,
    3: false,
    4: false,
    5: false,
    6: false,
  };
  FirebaseAuth fireAuth = FirebaseAuth.instance;
  int check = 0;
  void updateTestData(int testNumber, Map<String, dynamic> data) {
    if (check < testNumber) {
      qualityOfLifeTest.add(
        data,
      );
      check = testNumber;
    } else {
      qualityOfLifeTest[testNumber - 1] = data;
    }
  }

  final InternetConnectionChecker _internetChecker =
      InternetConnectionChecker();

  Future<void> addToFirebase(data) async {
    bool hasInternet = await _internetChecker.hasConnection;

    try {
      if (!hasInternet) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(tr("error.no_internet"))),
        );
        return;
      }
      await FireStoreService().addTestAnswers(
        userId: fireAuth.currentUser!.uid,
        testData: {"quality_of_life_test": data},
        testName: "quality_of_life",
      );
//////

      addToFirebase(qualityOfLifeTest);
      widget.checkBoxMission
          ? popMultiplePages(
              context: context,
              pagesToPop: 6,
              data: true,
            )
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
            };

/////
    } on Exception catch (e) {
      print(".....$e...........");
    }
  }

  @override
  void initState() {
    if (widget.testNumber == 1) {
      qualityOfLifeTest = [];
    }
    check = qualityOfLifeTest.length;
    super.initState();
  }

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
                                text: "${tr("test")} ${widget.testNumber}/6"),
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
                                value: (widget.testNumber / 6),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  switchQualityOfLifePage(
                    testNumber: widget.testNumber,
                    onTestCompletion: (value) {
                      setState(() {
                        testsCompletionStatus[widget.testNumber] = value;
                      });
                    },
                    onDataCollected: (data) {
                      updateTestData(widget.testNumber, data);
                    },
                  ),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
              Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: widget.testNumber < 6
                    ? defaultButton(
                        text: tr("continue"),
                        onTap: testsCompletionStatus[widget.testNumber] != false
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        QualityOfLifeMeasureScreen(
                                      testNumber: widget.testNumber + 1,
                                      checkBoxMission:
                                          widget.checkBoxMission == true
                                              ? true
                                              : false,
                                    ),
                                  ),
                                );
                              }
                            : null,
                      )
                    : defaultButton(
                        text: tr("finish"),
                        onTap: testsCompletionStatus[widget.testNumber] != false
                            ? () {
                                addToFirebase(qualityOfLifeTest);
                              }
                            : null,
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
