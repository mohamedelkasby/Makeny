import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makeny/screens/next_test_screen.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/danger_measure_tests/body_test_num6/switch_body_num6.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/green_note.dart';
import 'package:makeny/widgets/questions_type/long_one_answer_check.dart';
import 'package:makeny/widgets/switch_widget.dart';

class MultidimensionalDyspneaScaleScreen extends StatefulWidget {
  const MultidimensionalDyspneaScaleScreen({
    super.key,
    required this.appbar,
  });
  final String appbar;

  @override
  State<MultidimensionalDyspneaScaleScreen> createState() =>
      _MultidimensionalDyspneaScaleScreenState();
}

class _MultidimensionalDyspneaScaleScreenState
    extends State<MultidimensionalDyspneaScaleScreen> {
  int bodyIndex = 0;
  String? selectedAnswer;

  @override
  void initState() {
    bodyIndex = 0;
    selectedAnswer = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> greenText = [
      tr("multidimensional_DyspneaScale.green_text.text_1"),
      tr("multidimensional_DyspneaScale.green_text.text_2"),
      tr("multidimensional_DyspneaScale.green_text.text_3"),
    ];
    List<String> normalText = [
      tr("multidimensional_DyspneaScale.normal_text.text_1"),
      tr("multidimensional_DyspneaScale.normal_text.text_2"),
      ""
    ];
    return Scaffold(
      appBar: defaultAppbar(context, title: widget.appbar),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Stack(
          children: [
            ListView(
              children: [
                greenNote(
                  text: greenText[bodyIndex],
                ),
                normalText[bodyIndex] == ""
                    ? SizedBox()
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: defalutQuestionText(
                          text: normalText[bodyIndex],
                        ),
                      ),
                bodyIndex == 0
                    // first Page
                    ? LongOneAnswerCheck(
                        questionText: "",
                        answers: [
                          tr("tests.choose_one_qustions.test_6.answers.text_1"),
                          tr("tests.choose_one_qustions.test_6.answers.text_2"),
                          tr("tests.choose_one_qustions.test_6.answers.text_3"),
                          tr("tests.choose_one_qustions.test_6.answers.text_4"),
                          tr("tests.choose_one_qustions.test_6.answers.text_5"),
                        ],
                        ///// on answer sellected.
                        onAnswerSelected: (String answer) {
                          setState(() {
                            selectedAnswer = answer;
                          });
                        },
                      )
                    : switchBodyNum6(
                        bodyIndex,
                        selectedAnswer: selectedAnswer,
                      ),
                SizedBox(
                  height: 80,
                )
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: bodyIndex < 2
                  ? defaultButton(
                      text: tr("continue"),
                      onTap: selectedAnswer != null
                          ? () {
                              setState(() {
                                bodyIndex++;
                              });
                            }
                          : null,
                    )
                  : defaultButton(
                      text: tr("next"),
                      onTap: () {
                        //TODO: navigate to حجز موعد
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NextTestScreen(
                              appbar: switchAppbar(testNumber: 7),
                              testNumber: 7,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
