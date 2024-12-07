import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:makeny/services/fire_store_service.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/questions_type/grid_one_answer_check.dart';

class FunctionalPerformanceUpperLimbsTest extends StatefulWidget {
  const FunctionalPerformanceUpperLimbsTest({super.key});

  @override
  State<FunctionalPerformanceUpperLimbsTest> createState() =>
      _FunctionalPerformanceUpperLimbsTestState();
}

class _FunctionalPerformanceUpperLimbsTestState
    extends State<FunctionalPerformanceUpperLimbsTest> {
  List<int?> selectedAnswers = [];
  FirebaseAuth fireAuth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    selectedAnswers = List.generate(qustions.length, (_) => null);
  }

  void updateAnswer(int questionIndex, int answerIndex) {
    setState(() {
      selectedAnswers[questionIndex] = answerIndex;
    });
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
        testData: {
          "choose_answers": data,
        },
        testName: "functional_performance_upper_limbs",
      );
      Navigator.pop(context, true);
    } on Exception catch (e) {
      print(".....$e...........");
    }
  }

  bool get allQuestionsAnswered => !selectedAnswers.contains(null);
  List<String> answerlists = [
    tr("consultation_tests.functional_performance_upper_limbs.answers.number_1"),
    tr("consultation_tests.functional_performance_upper_limbs.answers.number_2"),
    tr("consultation_tests.functional_performance_upper_limbs.answers.number_3"),
    tr("consultation_tests.functional_performance_upper_limbs.answers.number_4"),
    tr("consultation_tests.functional_performance_upper_limbs.answers.number_5"),
  ];

  List<String> qustions = [
    tr("consultation_tests.functional_performance_upper_limbs.questions.number_1"),
    tr("consultation_tests.functional_performance_upper_limbs.questions.number_2"),
    tr("consultation_tests.functional_performance_upper_limbs.questions.number_3"),
    tr("consultation_tests.functional_performance_upper_limbs.questions.number_4"),
    tr("consultation_tests.functional_performance_upper_limbs.questions.number_5"),
    tr("consultation_tests.functional_performance_upper_limbs.questions.number_6"),
    tr("consultation_tests.functional_performance_upper_limbs.questions.number_7"),
    tr("consultation_tests.functional_performance_upper_limbs.questions.number_8"),
    tr("consultation_tests.functional_performance_upper_limbs.questions.number_9"),
    tr("consultation_tests.functional_performance_upper_limbs.questions.number_10"),
    tr("consultation_tests.functional_performance_upper_limbs.questions.number_11"),
    tr("consultation_tests.functional_performance_upper_limbs.questions.number_12"),
    tr("consultation_tests.functional_performance_upper_limbs.questions.number_13"),
    tr("consultation_tests.functional_performance_upper_limbs.questions.number_14"),
    tr("consultation_tests.functional_performance_upper_limbs.questions.number_15"),
    tr("consultation_tests.functional_performance_upper_limbs.questions.number_16"),
    tr("consultation_tests.functional_performance_upper_limbs.questions.number_17"),
    tr("consultation_tests.functional_performance_upper_limbs.questions.number_18"),
    tr("consultation_tests.functional_performance_upper_limbs.questions.number_19"),
    tr("consultation_tests.functional_performance_upper_limbs.questions.number_20"),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: defaultAppbar(context,
            title: tr(
                "consultation_tests.functional_performance_upper_limbs.test_name")),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Stack(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: qustions.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GridOneAnswerCheck(
                        questionsText: qustions[index],
                        selectedAnswer: selectedAnswers[index],
                        onAnswerSelected: (answerIndex) =>
                            updateAnswer(index, answerIndex),
                        answers: answerlists,
                      ),
                      index + 1 == qustions.length
                          ? SizedBox(
                              height: 80,
                            )
                          : SizedBox()
                    ],
                  );
                },
              ),
              SizedBox(
                height: 80,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: defaultButton(
                  text: tr("finish"),
                  onTap: allQuestionsAnswered
                      ? () {
                          addToFirebase(selectedAnswers);
                        }
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
