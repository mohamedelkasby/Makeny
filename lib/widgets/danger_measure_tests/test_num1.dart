import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makeny/cubits/cubit.dart';
import 'package:makeny/cubits/status.dart';
import 'package:makeny/widgets/custom_list_field.dart';
import 'package:makeny/widgets/green_note.dart';
import 'package:makeny/widgets/questions_type/yes_or_no_question.dart';

class TestNumber1 extends StatefulWidget {
  const TestNumber1({
    super.key,
    this.yesOrNoQuestions = const [],
  });
  final List<String> yesOrNoQuestions;

  @override
  State<TestNumber1> createState() => _TestNumber1State();
}

class _TestNumber1State extends State<TestNumber1> {
  bool allQuestionsAnswered = false;
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xffD0FFBF)),
                  child: greenNote(
                    text:
                        "الرجاء اجابة الاختبارات التالية لتحديد انسب الاطباء لك..",
                  )),
            ),
            YesOrNoQuestions(
              questionsText: widget.yesOrNoQuestions,
              onAllQuestionsAnswered: (allAnswered) {
                setState(() {
                  allQuestionsAnswered = allAnswered;
                });
              },
            ),
            CustomListField(
              suffixList: const ["سم", "انش"],
              qustionText: "الطول",
              controller: textEditingController,
            ),
            CustomListField(
              suffixList: const ["كجم", "جم"],
              qustionText: "الوزن",
              controller: textEditingController,
            ),
            CustomListField(
              suffixList: const ["كجم/م2", "جم/م2"],
              qustionText: "كتلة الجسم",
              enable: false,
              controller: textEditingController,
            ),
            CustomListField(
              suffixList: const ["سم", "انش"],
              qustionText: "الخصر",
              controller: textEditingController,
            ),
            CustomListField(
              suffixList: const ["سم", "انش"],
              qustionText: "محيط الرقبة",
              controller: textEditingController,
            ),
            CustomListField(
              suffixText: "نبضة كل دقيقة",
              qustionText: "النبض",
              hintText: "100/60",
              controller: textEditingController,
            ),
            CustomListField(
              qustionText: "مستوى الاكسحين",
              hintText: "100/90",
              controller: textEditingController,
            ),
            CustomListField(
              qustionText: "ضغط الدم الانقباضى",
              hintText: "140/100",
              suffixList: const ["ملم زئبقي"],
              controller: textEditingController,
            ),
            CustomListField(
              qustionText: "ضغط الدم الانبساطى",
              hintText: "80/60",
              suffixList: const ["ملم زئبقي"],
              controller: textEditingController,
            ),
            CustomListField(
              qustionText: "الكلسترول",
              hintText: "5.2/0",
              controller: textEditingController,
            ),
            CustomListField(
              qustionText: "الدهون الثلاثية النافعة",
              hintText: "0",
              suffixList: const ["سم"],
              controller: textEditingController,
            ),
          ],
        );
      },
    );
  }
}
