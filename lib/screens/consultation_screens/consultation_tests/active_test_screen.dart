import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/green_note.dart';
import 'package:makeny/widgets/questions_type/yes_or_no_question.dart';

class ActiveTestScreen extends StatefulWidget {
  const ActiveTestScreen({
    super.key,
  });

  @override
  State<ActiveTestScreen> createState() => _ActiveTestScreenState();
}

class _ActiveTestScreenState extends State<ActiveTestScreen> {
  final List<String> yesOrNoQuestions = [
    tr("consultation_tests.physical_activity.questions.number_1"),
    tr("consultation_tests.physical_activity.questions.number_2"),
    tr("consultation_tests.physical_activity.questions.number_3"),
    tr("consultation_tests.physical_activity.questions.number_4"),
    tr("consultation_tests.physical_activity.questions.number_5"),
    tr("consultation_tests.physical_activity.questions.number_6"),
    tr("consultation_tests.physical_activity.questions.number_7"),
    tr("consultation_tests.physical_activity.questions.number_8"),
    tr("consultation_tests.physical_activity.questions.number_9"),
    tr("consultation_tests.physical_activity.questions.number_10"),
    tr("consultation_tests.physical_activity.questions.number_11"),
  ];
  bool allQuestionsAnswered = false;

  // @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: defaultAppbar(
          context,
          title: tr("consultation_tests.physical_activity.test_name"),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Stack(
            children: [
              ListView(
                children: [
                  greenNote(
                    text: tr("consultation_tests.physical_activity.green_note"),
                  ),
                  YesOrNoQuestions(
                    questionsText: yesOrNoQuestions,
                    onAllQuestionsAnswered: (allAnswered) {
                      setState(() {
                        allQuestionsAnswered = allAnswered;
                      });
                    },
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
                child: defaultButton(
                  text: tr("save"),
                  onTap: allQuestionsAnswered
                      ? () {
                          Navigator.pop(context, allQuestionsAnswered);
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
