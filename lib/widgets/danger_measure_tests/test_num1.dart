import 'package:easy_localization/easy_localization.dart';
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
                    text: tr("green_note.test_1"),
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
              suffixList: [
                tr("calculates.cm"),
                tr("calculates.inch"),
              ],
              qustionText: tr("accountPage.tall"),
              controller: textEditingController,
            ),
            CustomListField(
              suffixList: [
                tr("calculates.kg"),
                tr("calculates.g"),
              ],
              qustionText: tr("accountPage.wight"),
              controller: textEditingController,
            ),
            CustomListField(
              suffixList: [
                tr("calculates.kg/m2"),
                tr("calculates.g/m2"),
              ],
              qustionText: tr("medicalFile.body_mass"),
              enable: false,
              controller: textEditingController,
            ),
            CustomListField(
              suffixList: [
                tr("calculates.cm"),
                tr("calculates.inch"),
              ],
              qustionText: tr("accountPage.waist"),
              controller: textEditingController,
            ),
            CustomListField(
              suffixList: [
                tr("calculates.cm"),
                tr("calculates.inch"),
              ],
              qustionText: tr("neck_circumference"),
              controller: textEditingController,
            ),
            CustomListField(
              suffixText: tr("calculates.pbm"),
              qustionText: tr("pulse"),
              hintText: "100/60",
              controller: textEditingController,
            ),
            CustomListField(
              qustionText: tr("oxygen_level"),
              hintText: "100/90",
              controller: textEditingController,
            ),
            CustomListField(
              qustionText: tr("systolic_blood_pressure"),
              hintText: "140/100",
              suffixList: [tr("calculates.mmHg")],
              controller: textEditingController,
            ),
            CustomListField(
              qustionText: tr("diastolic_blood_pressure"),
              hintText: "80/60",
              suffixList: [tr("calculates.mmHg")],
              controller: textEditingController,
            ),
            CustomListField(
              qustionText: tr("cholesterol"),
              hintText: "5.2/0",
              controller: textEditingController,
            ),
            CustomListField(
              qustionText: tr("good_triglycerides"),
              hintText: "0",
              suffixList: [tr("calculates.cm")],
              controller: textEditingController,
            ),
          ],
        );
      },
    );
  }
}
