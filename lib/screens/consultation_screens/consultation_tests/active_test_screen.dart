import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:makeny/services/fire_store_service.dart';
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
  List yesNoAnswers = [];
  FirebaseAuth fireAuth = FirebaseAuth.instance;
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

  final InternetConnectionChecker _internetChecker =
      InternetConnectionChecker();

  void addToFirebase(data) async {
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
        testData: {
          "Yes_No_answers": data,
        },
        testName: "phsical_activity",
      );
      Navigator.pop(context, allQuestionsAnswered);
    } on Exception catch (e) {
      print(".....$e...........");
    }
  }

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
                    onAnswersChanged: (value) {
                      yesNoAnswers = value;
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
                          addToFirebase(yesNoAnswers);
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
