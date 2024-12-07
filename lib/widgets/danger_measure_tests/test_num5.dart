import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makeny/widgets/green_note.dart';
import 'package:makeny/widgets/questions_type/grid_one_answer_check.dart';

class TestNumber5 extends StatefulWidget {
  const TestNumber5({
    super.key,
    this.yesOrNoQuestions,
    this.onTestCompletion,
    this.onDataCollected,
  });
  final List<String>? yesOrNoQuestions;
  final Function(bool)? onTestCompletion;
  final Function(Map<String, dynamic>)? onDataCollected;

  @override
  State<TestNumber5> createState() => _TestNumber5State();
}

class _TestNumber5State extends State<TestNumber5> {
  List<int?> selectedAnswers =
      List.filled(12, null); // Assuming there are 12 questions

  void onAnswerSelected(int questionIndex, int answerIndex) {
    setState(() {
      selectedAnswers[questionIndex] = answerIndex;
    });
    if (!selectedAnswers.contains(null)) {
      widget.onTestCompletion!.call(true);
      widget.onDataCollected!.call({
        "select_one_answer_questions": selectedAnswers,
      });
    }
  }

  List<Questions> questions = [
    Questions(
      question: tr("test_5_page.choose_qustions.question_1"),
      answers: [
        "${tr("test_5_page.i_did_not_do_this_activity")}\n( 0 )",
        "${tr("test_5_page.highly_limited")}\n( 4 ~1 )",
        "${tr("test_5_page.severely_limited")}\n( 7 ~ 4 )",
        "${tr("test_5_page.moderately_limited")}\n( 10 ~ 7 )",
        "${tr("test_5_page.slightly_limited")}\n( 18 ~10 )",
      ],
    ),
    Questions(
      question: tr("test_5_page.choose_qustions.question_2"),
      answers: [
        "${tr("test_5_page.i_did_not_do_this_activity")}\n( 0 )",
        "${tr("test_5_page.highly_limited")}\n( 50 ~ 10 )",
        "${tr("test_5_page.severely_limited")}\n( 100 ~ 50 )",
        "${tr("test_5_page.moderately_limited")}\n( 200 ~ 100 )",
        "${tr("test_5_page.slightly_limited")}\n( 250 ~200 )",
      ],
    ),
    Questions(
      question: tr("test_5_page.choose_qustions.question_3"),
      answers: [
        "${tr("test_5_page.i_did_not_do_this_activity")}\n( 0 )",
        "${tr("test_5_page.highly_limited")}\n( 4 ~1 )",
        "${tr("test_5_page.severely_limited")}\n( 7 ~ 4 )",
        "${tr("test_5_page.moderately_limited")}\n( 10 ~ 7 )",
        "${tr("test_5_page.slightly_limited")}\n( 18 ~10 )",
      ],
    ),
    Questions(
      question: tr("test_5_page.choose_qustions.question_4"),
      answers: [
        tr("test_5_page.all_the_time"),
        tr("test_5_page.3_or_more_times_a_week"),
        tr("test_5_page.once_or_twice_a_week"),
        tr("test_5_page.less_than_once_a_week"),
        tr("test_5_page.no_occurrence_past_two_weeks"),
      ],
    ),
    Questions(
      question: tr("test_5_page.choose_qustions.question_5"),
      answers: [
        tr("test_5_page.all_the_time"),
        tr("test_5_page.3_or_more_times_a_week"),
        tr("test_5_page.once_or_twice_a_week"),
        tr("test_5_page.less_than_once_a_week"),
        tr("test_5_page.no_occurrence_past_two_weeks"),
      ],
    ),
    Questions(
      question: tr("test_5_page.choose_qustions.question_6"),
      answers: [
        "${tr("test_5_page.i_did_not_do_this_activity")}\n( 0 )",
        "${tr("test_5_page.highly_limited")}\n( 4 ~1 )",
        "${tr("test_5_page.severely_limited")}\n( 7 ~ 4 )",
        "${tr("test_5_page.moderately_limited")}\n( 10 ~ 7 )",
        "${tr("test_5_page.slightly_limited")}\n( 18 ~10 )",
      ],
    ),
    Questions(
      question: tr("test_5_page.choose_qustions.question_7"),
      answers: [
        "${tr("test_5_page.i_did_not_do_this_activity")}\n( 0 )",
        "${tr("test_5_page.highly_limited")}\n( 4 ~1 )",
        "${tr("test_5_page.severely_limited")}\n( 7 ~ 4 )",
        "${tr("test_5_page.moderately_limited")}\n( 10 ~ 7 )",
        "${tr("test_5_page.slightly_limited")}\n( 18 ~10 )",
      ],
    ),
    Questions(
      question: tr("test_5_page.choose_qustions.question_8"),
      answers: [
        tr("test_5_page.decrease_very_high"),
        tr("test_5_page.decrease_high"),
        tr("test_5_page.decrease_medium"),
        tr("test_5_page.decrease_low"),
        tr("test_5_page.decrease_none"),
      ],
    ),
    Questions(
      question: tr("test_5_page.choose_qustions.question_9"),
      answers: [
        tr("test_5_page.decrease_very_high"),
        tr("test_5_page.decrease_high"),
        tr("test_5_page.decrease_medium"),
        tr("test_5_page.decrease_low"),
        tr("test_5_page.decrease_none"),
      ],
    ),
    Questions(
      question: tr("test_5_page.choose_qustions.question_10"),
      answers: [
        tr("test_5_page.tightly_bound"),
        tr("test_5_page.highly_restricted"),
        tr("test_5_page.medium_restricted"),
        tr("test_5_page.lightly_restricted"),
        tr("test_5_page.totally_unrestricted"),
        tr("test_5_page.i_did_not_do_this_activity"),
      ],
    ),
    Questions(
      question: tr("test_5_page.choose_qustions.question_11"),
      answers: [
        tr("test_5_page.tightly_bound"),
        tr("test_5_page.highly_restricted"),
        tr("test_5_page.medium_restricted"),
        tr("test_5_page.lightly_restricted"),
        tr("test_5_page.totally_unrestricted"),
        tr("test_5_page.i_did_not_do_this_activity"),
      ],
    ),
    Questions(
      question: tr("test_5_page.choose_qustions.question_12"),
      answers: [
        tr("test_5_page.tightly_bound"),
        tr("test_5_page.highly_restricted"),
        tr("test_5_page.medium_restricted"),
        tr("test_5_page.lightly_restricted"),
        tr("test_5_page.totally_unrestricted"),
        tr("test_5_page.i_did_not_do_this_activity"),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ////// the green text Start   ////
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: greenNote(
            text: tr("green_note.test_5"),
            headerText: tr("notice"),
          ),
        ),
        ////// the green text End   ////
        ...List.generate(
          questions.length,
          (index) => GridOneAnswerCheck(
            onAnswerSelected: (answerIndex) =>
                onAnswerSelected(index, answerIndex),
            questionsText: questions[index].question,
            selectedAnswer: selectedAnswers[index],
            answers: questions[index].answers,
          ),
        ),
      ],
    );
  }
}

class Questions {
  final String question;
  final List<String> answers;

  Questions({
    required this.question,
    required this.answers,
  });
}
