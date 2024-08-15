import 'package:flutter/material.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/questions_type/grid_one_answer_check.dart';

class FunctionalPerformanceLowerLimbsTest extends StatefulWidget {
  const FunctionalPerformanceLowerLimbsTest({super.key});

  @override
  State<FunctionalPerformanceLowerLimbsTest> createState() =>
      _FunctionalPerformanceLowerLimbsTestState();
}

class _FunctionalPerformanceLowerLimbsTestState
    extends State<FunctionalPerformanceLowerLimbsTest> {
  List<int?> selectedAnswers = [];

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

  bool get allQuestionsAnswered => !selectedAnswers.contains(null);

  List<String> answerlists = [
    "عدم القدرة علي اداء النشاط ",
    "صعوبة كبيرة ",
    "صعوبة متوسطة  ",
    "صعوبة بسيطة",
    "لا توجد صعوبة ",
  ];

  List<String> qustions = [
    "القيام بالاعمال المعتادة مثل الاعمال المنزلية , او الانشطة المدرسية ",
    "هواياتك المعتادة ،الأنشطة الترفيهية أو الرياضية",
    "المشي بين الغرف",
    "ارتداء الأحذية أو الجوارب",
    "جلسة القرفصاء",
    "رفع أي غرض، مثل كيس المشتريات من الأرض",
    "أداء أنشطة خفيفة في منزلك",
    "أداء أنشطة ثقيلة في منزلك",
    "الدخول أو الخروج من السيارة",
    "المشي مسافة 250 متر",
    "المشي مسافة 1.5 كيلومتر",
    "صعود و نزول الدرج 10 درجات",
    "فتح الأبواب",
    "الجلوس لمدة ساعة.",
    "الجري على ارض مستوية.",
    "الجري على ارض غير مستوية.",
    "القيام بانعطافات حادة أثناء الجري السريع.",
    "الوثب",
    "التقلب في السرير",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(context, title: "الاداء الوظيفي للاطراف السفلية"),
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
                text: "انهاء",
                onTap: allQuestionsAnswered
                    ? () => Navigator.pop(context, true)
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
