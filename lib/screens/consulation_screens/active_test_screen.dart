import 'package:flutter/material.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/green_note.dart';
import 'package:makeny/widgets/questions_type/yes_or_no_question.dart';

class ActiveTestScreen extends StatefulWidget {
  const ActiveTestScreen({super.key});

  @override
  State<ActiveTestScreen> createState() => _ActiveTestScreenState();
}

class _ActiveTestScreenState extends State<ActiveTestScreen> {
  List<String> yesOrNoQuestions = [
    "هل تستطيع العناية بنفسك في الاكل والملابس والاستحمام واستخدام الحمام ؟",
    "هل تستطيع المشي داخل المنزل   ؟",
    "هل تستطيع المشي مسافة 100 الي 250 متر علي ارض مستوية ؟",
    "هل تستطيع صعود الدرج او التل ؟",
    "هل تستطيع الجري لمسافة قصيرة  ؟",
    "هل تستطيع القيام باعمال منزلية خفيفة مثل نفض الغبار اوغسيل الصحون ؟",
    "هل تستطيع القيام باعمال منزلية  في الحديقة مثل جرف الاشجار وازالة العشب من الحديقة  ؟",
    "هل تستطيع القيام باعمال منزلية متوسطة الشدة  مثل كنيس ومسح الارضيات وشراء البقالة  ؟",
    "هل تستطيع القيام بالمعاشرة الزوجية ؟",
    "هل تستطيع المشاركة في الانشطة الترفيهية مثل الرقصات الشعبية ولعبة الجولف والمشي خمسة كيلو متر في الساعة ؟ ",
    "هل تستطيع المشاركة في الانشطة الترفيهية عالية الجهد  مثل لعب كرة القدم وكرة السلة والجري 8 كيلو متر في الساعه ؟ ",
  ];

  // @override
  // void initState() {
  //   AppCubit.get(context).initTheSelectedAnswers(yesOrNoQuestions.length);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(context, title: "اختبار  النشاط البدني "),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ListView(
          children: [
            greenNote(
                text:
                    " يرجي تحديد ما اذا كنت تستطيع القيام باي نشاط من الانشطة التالي في الوقت الحالي او لا تستطيع القيام بها "),
            YesOrNoQuestions(
              questionsText: yesOrNoQuestions,
            ),
            defaultButton(text: "حفظ", onTap: () {})
          ],
        ),
      ),
    );
  }
}
