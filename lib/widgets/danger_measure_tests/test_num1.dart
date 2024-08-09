import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makeny/cubit/cubit.dart';
import 'package:makeny/cubit/status.dart';
import 'package:makeny/widgets/custom_list_field.dart';
import 'package:makeny/widgets/green_note.dart';
import 'package:makeny/widgets/questions_type/yes_or_no_question.dart';

class TestNumber1 extends StatelessWidget {
  const TestNumber1({
    super.key,
    this.yesOrNoQuestions = const [],
  });
  final List<String> yesOrNoQuestions;
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
              questionsText: yesOrNoQuestions,
            ),
            const CustomListField(
              suffixList: ["سم", "انش"],
              qustionText: "الطول",
            ),
            const CustomListField(
              suffixList: ["كجم", "جم"],
              qustionText: "الوزن",
            ),
            const CustomListField(
              suffixList: ["كجم/م2", "جم/م2"],
              qustionText: "كتلة الجسم",
              enable: false,
            ),
            const CustomListField(
              suffixList: ["سم", "انش"],
              qustionText: "الخصر",
            ),
            const CustomListField(
              suffixList: ["سم", "انش"],
              qustionText: "محيط الرقبة",
            ),
            const CustomListField(
              suffixText: "نبضة كل دقيقة",
              qustionText: "النبض",
              hintText: "100/60",
            ),
            const CustomListField(
              qustionText: "مستوى الاكسحين",
              hintText: "100/90",
            ),
            const CustomListField(
              qustionText: "ضغط الدم الانقباضى",
              hintText: "140/100",
              suffixList: ["ملم زئبقي"],
            ),
            const CustomListField(
              qustionText: "ضغط الدم الانبساطى",
              hintText: "80/60",
              suffixList: ["ملم زئبقي"],
            ),
            const CustomListField(
              qustionText: "الكلسترول",
              hintText: "5.2/0",
            ),
            const CustomListField(
              qustionText: "الدهون الثلاثية النافعة",
              hintText: "0",
              suffixList: ["سم"],
            ),
          ],
        );
      },
    );
  }
}
