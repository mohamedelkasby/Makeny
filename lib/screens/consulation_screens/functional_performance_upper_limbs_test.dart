import 'package:flutter/material.dart';
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
    "القيام بالاعمال المعتادة مثل الاعمال المنزلية , او الانشطة المدرسية",
    "الهوايات المعتادة، أو الأنشطة الترفيهية، أو الرياضية",
    "رفع كيس المشتريات إلى مستوى الخصر",
    "وضع أو إنزال شيء ما من على رف عالي",
    "غسل الشعر أو فروة الرأس",
    "الدفع باليدين للنهوض مثال:عند القيام من الكرسي أو من حوض الاستحمام",
    "تحضر الطعام مثال: التقشريأو التقطيع",
    "قيادة السيارة",
    "الكنس بمكنسة كهربائية أو يدوية",
    "ارتداء الملابس",
    "اغلاق أزرار الملابس",
    "استخدام الأدوات أو الأجهزة",
    "فتح الأبواب",
    "التنظيف",
    "ربط الحذاء",
    "النوم",
    "تنظيف الملابس مثال: غسل أو كي أو طي الملابس",
    "فتح برطمان مثال: فتح علبة المربى",
    "رمي كرة",
    "محل حقيبة صغرية بالطرف المصاب",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(context, title: "الاداء الوظيفي للاطراف العلوية"),
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
