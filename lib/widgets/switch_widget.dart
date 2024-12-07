import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/danger_measure_tests/test_num1.dart';
import 'package:makeny/widgets/danger_measure_tests/test_num2.dart';
import 'package:makeny/widgets/danger_measure_tests/test_num3.dart';
import 'package:makeny/widgets/danger_measure_tests/test_num4.dart';
import 'package:makeny/widgets/danger_measure_tests/test_num5.dart';
import 'package:makeny/widgets/danger_measure_tests/test_num6.dart';
import 'package:makeny/widgets/green_note.dart';
import 'package:makeny/widgets/questions_type/long_one_answer_check.dart';
import 'package:makeny/widgets/slider_widget.dart';

Widget switchPagesTest(
  context, {
  required final int testNumber,
  final List<String> yesOrNoQuestions = const [],
  final Function(bool)? onTestCompletion,
  final Function(Map<String, dynamic>)? onDataCollected,
}) {
  // print("switchPagesTest called with testNumber: $testNumber");
  switch (testNumber) {
    case 1:
      return TestNumber1(
        yesOrNoQuestions: yesOrNoQuestions,
        onTestCompletion: onTestCompletion,
        onDataCollected: onDataCollected,
      );
    case 2:
      return TestNumber2(
        yesOrNoQuestions: yesOrNoQuestions,
        onTestCompletion: onTestCompletion,
        onDataCollected: onDataCollected,
      );
    case 3:
      return TestNumber3(
        yesOrNoQuestions: yesOrNoQuestions,
        onTestCompletion: onTestCompletion,
        onDataCollected: onDataCollected,
      );
    case 4:
      return testNumber4(
        context,
        onTestCompletion: onTestCompletion,
        onDataCollected: onDataCollected,
      );
    case 5:
      return TestNumber5(
        onTestCompletion: onTestCompletion,
        onDataCollected: onDataCollected,
      );
    case 6:
      return TestNumber6(
        onTestCompletion: onTestCompletion,
        onDataCollected: onDataCollected,
      );
    // case 7:
    //   return TestNumber1(yesOrNoQuestions: yesOrNoQuestions);
    default:
      return const SizedBox();
  }
}

String switchAppbar({
  required final int testNumber,
}) {
  switch (testNumber) {
    case 1:
      return tr("tests.appbar.number_1");
    case 2:
      return tr("tests.appbar.number_2");
    case 3:
      return tr("tests.appbar.number_3");
    case 4:
      return tr("tests.appbar.number_4");
    case 5:
      return tr("tests.appbar.number_5");
    case 6:
      return tr("tests.appbar.number_6");
    case 7:
      return tr("tests.appbar.number_7");

    default:
      return "";
  }
}

Widget switchNextTest({
  required final int testNumber,
}) {
  switch (testNumber) {
    case 1:
      return Image.asset(
        'assets/gif/cell.gif',
        height: 250,
      );
    case 2:
      return Image.asset(
        'assets/gif/check.gif',
        height: 300,
      );
    case 3:
      return Image.asset(
        'assets/gif/lung.gif',
        height: 300,
      );
    case 4:
      return Image.asset(
        'assets/gif/heart.gif',
        height: 300,
      );
    case 5:
      return Image.asset(
        'assets/gif/lung.gif',
        height: 300,
      );
    case 6:
      return Image.asset(
        'assets/gif/heart_attack.gif',
        height: 300,
      );
    case 7:
      return Image.asset(
        'assets/gif/mediacl_file.gif',
        height: 300,
      );
    default:
      return Image.asset(
        "assets/gif/dna.gif",
        height: 300,
      );
  }
}

List<String> switchNextTestListText({
  required final int testNumber,
}) {
  switch (testNumber) {
    case 1:
      return [
        tr("tests.next_page.number_1.top_line"),
        tr("tests.next_page.number_1.bottom_line"),
      ];
    case 2:
      return [
        tr("tests.next_page.number_2.top_line"),
        tr("tests.next_page.number_2.bottom_line"),
      ];
    case 3:
      return [
        tr("tests.next_page.number_1.top_line"),
        tr("tests.next_page.number_1.bottom_line"),
      ];
    case 4:
      return [
        tr("tests.next_page.number_4.top_line"),
        "",
      ];
    case 5:
      return [
        tr("tests.next_page.number_5.top_line"),
        "",
      ];
    case 6:
      return [
        tr("tests.next_page.number_6.top_line"),
        tr("tests.next_page.number_6.bottom_line"),
      ];
    case 7:
      return [
        tr("tests.next_page.number_7.top_line"),
        tr("tests.next_page.number_7.bottom_line"),
      ];
    default:
      return [
        tr("tests.next_page.number_default.top_line"),
        tr("tests.next_page.number_default.bottom_line"),
      ];
  }
}

Widget switchQualityOfLifePage({
  testNumber,
  final Function(bool)? onTestCompletion,
  final Function(Map<String, dynamic>)? onDataCollected,
}) {
  switch (testNumber) {
    case 1:
      return Column(
        children: [
          greenNote(
            text: tr("green_note_QualityOfLife.test_6."),
          ),
          LongOneAnswerCheck(
            questionText:
                tr("tests.choose_one_qustions.test_1.question_number_1"),
            answers: [
              tr("tests.choose_one_qustions.test_1.answers.text_1"),
              tr("tests.choose_one_qustions.test_1.answers.text_2"),
              tr("tests.choose_one_qustions.test_1.answers.text_3"),
              tr("tests.choose_one_qustions.test_1.answers.text_4"),
              tr("tests.choose_one_qustions.test_1.answers.text_5"),
            ],
            onAnswerSelected: (value) {
              onTestCompletion!.call(true);
              onDataCollected!.call(
                {
                  "question_answer_num_1": value.first,
                },
              );
            },
          ),
        ],
      );
    case 2:
      return LongOneAnswerCheck(
        questionText: tr("tests.choose_one_qustions.test_2.question_number_1"),
        answers: [
          tr("tests.choose_one_qustions.test_2.answers.text_1"),
          tr("tests.choose_one_qustions.test_2.answers.text_2"),
          tr("tests.choose_one_qustions.test_2.answers.text_3"),
          tr("tests.choose_one_qustions.test_2.answers.text_4"),
          tr("tests.choose_one_qustions.test_2.answers.text_5"),
        ],
        onAnswerSelected: (value) {
          onTestCompletion!.call(true);
          onDataCollected!.call(
            {
              "question_answer_num_2": value.first,
            },
          );
        },
      );
    case 3:
      return LongOneAnswerCheck(
        questionText: tr("tests.choose_one_qustions.test_3.question_number_1"),
        answers: [
          tr("tests.choose_one_qustions.test_3.answers.text_1"),
          tr("tests.choose_one_qustions.test_3.answers.text_2"),
          tr("tests.choose_one_qustions.test_3.answers.text_3"),
          tr("tests.choose_one_qustions.test_3.answers.text_4"),
          tr("tests.choose_one_qustions.test_3.answers.text_5"),
        ],
        onAnswerSelected: (value) {
          onTestCompletion!.call(true);
          onDataCollected!.call(
            {
              "question_answer_num_3": value.first,
            },
          );
        },
      );
    case 4:
      return LongOneAnswerCheck(
        questionText: tr("tests.choose_one_qustions.test_4.question_number_1"),
        answers: [
          tr("tests.choose_one_qustions.test_4.answers.text_1"),
          tr("tests.choose_one_qustions.test_4.answers.text_2"),
          tr("tests.choose_one_qustions.test_4.answers.text_3"),
          tr("tests.choose_one_qustions.test_4.answers.text_4"),
          tr("tests.choose_one_qustions.test_4.answers.text_5"),
        ],
        onAnswerSelected: (value) {
          onTestCompletion!.call(true);
          onDataCollected!.call(
            {
              "question_answer_num_4": value.first,
            },
          );
        },
      );
    case 5:
      return LongOneAnswerCheck(
        questionText: tr("tests.choose_one_qustions.test_5.question_number_1"),
        answers: [
          tr("tests.choose_one_qustions.test_5.answers.text_1"),
          tr("tests.choose_one_qustions.test_5.answers.text_2"),
          tr("tests.choose_one_qustions.test_5.answers.text_3"),
          tr("tests.choose_one_qustions.test_5.answers.text_4"),
          tr("tests.choose_one_qustions.test_5.answers.text_5"),
        ],
        onAnswerSelected: (value) {
          onTestCompletion!.call(true);
          onDataCollected!.call(
            {
              "question_answer_num_5": value.first,
            },
          );
        },
      );
    case 6:
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 10,
            ),
            child: defalutQuestionText(text: tr("your_quality_of_life")),
          ),
          greenNote(
            text: tr("green_note_QualityOfLife.test_6"),
          ),
          SizedBox(
            height: 120,
          ),
          SliderWidget(
            onTestCompletion: onTestCompletion,
            onDataCollected: onDataCollected,
          ),
        ],
      );
    default:
      return SizedBox();
  }
}
