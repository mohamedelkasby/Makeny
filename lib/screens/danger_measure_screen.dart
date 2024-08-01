import 'package:flutter/material.dart';
import 'package:makeny/cubit/cubit.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/next_test_screen.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/custom_list_field.dart';
import 'package:makeny/widgets/defualt_appbar.dart';

class DangerMeasureScreen extends StatefulWidget {
  DangerMeasureScreen({
    super.key,
    required this.appbar,
    this.progress = (1 / 7),
    this.testNumber = 1,
  });
  final String appbar;
  int testNumber;
  double progress;
  @override
  State<DangerMeasureScreen> createState() => _DangerMeasureScreenState();
}

class _DangerMeasureScreenState extends State<DangerMeasureScreen> {
  /////// if the number of questions was not as the this variable it will give error
  // final int numberOfQuestions = ;
  List<String> yesOrNoQuestions = ["هل تدخن؟"];
  @override
  void initState() {
    super.initState();
    //// this to make when enter the page the default value will be false
    AppCubit.get(context).initializeQuestions(yesOrNoQuestions.length);
  }

  // double progress = (1 / 7);
  // int testNumber = 1;

  @override
  Widget build(BuildContext context) {
    int testNumber = widget.testNumber;
    double progress = widget.progress;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: defaultAppbar(context, title: widget.appbar),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: ListView(
          children: [
            /////// the progress indecator Start //////
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                padding: EdgeInsets.all(
                  2,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: greyColor,
                      offset: Offset(0, 1),
                      blurRadius: 10,
                      spreadRadius: -11,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 8),
                      child: defText(text: "اختبار $testNumber/7"),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        child: LinearProgressIndicator(
                          color: mainColor,
                          backgroundColor: mainColor100,
                          minHeight: 8,
                          borderRadius: BorderRadius.circular(50),
                          value: progress,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /////// the progress indecator end //////
            ///
            ///the green container with text  ///

            testNumber == 1
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffD0FFBF)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 10,
                        ),
                        child: defText(
                          text:
                              "الرجاء اجابة الاختبارات التالية لتحديد انسب الاطباء لك..",
                        ),
                      ),
                    ),
                  )
                : SizedBox(
                    height: 5,
                  ),

            /////// the yes or no question ////

            switch (testNumber) {
              // TODO: Handle this case.
              int() => Column(
                  children: [
                    yesOrNoQusions(
                      context,
                      questionsText: yesOrNoQuestions,
                      // questionIndex: 0,
                    ),
                    CustomListField(
                      suffixList: ["سم", "انش"],
                      qustionText: "الطول",
                    ),
                    CustomListField(
                      suffixList: ["كجم", "جم"],
                      qustionText: "الوزن",
                    ),
                    CustomListField(
                      suffixList: ["كجم/م2", "جم/م2"],
                      qustionText: "كتلة الجسم",
                      enable: false,
                    ),
                    CustomListField(
                      suffixList: ["سم", "انش"],
                      qustionText: "الخصر",
                    ),
                    CustomListField(
                      suffixList: ["سم", "انش"],
                      qustionText: "محيط الرقبة",
                    ),
                    CustomListField(
                      suffixText: "نبضة كل دقيقة",
                      qustionText: "النبض",
                      hintText: "100/60",
                    ),
                    CustomListField(
                      qustionText: "مستوى الاكسحين",
                      hintText: "100/90",
                    ),
                    CustomListField(
                      qustionText: "ضغط الدم الانقباضى",
                      hintText: "140/100",
                      suffixList: ["ملم زئبقي"],
                    ),
                    CustomListField(
                      qustionText: "ضغط الدم الانبساطى",
                      hintText: "80/60",
                      suffixList: ["ملم زئبقي"],
                    ),
                    CustomListField(
                      qustionText: "الكلسترول",
                      hintText: "5.2/0",
                    ),
                    CustomListField(
                      qustionText: "الدهون الثلاثية النافعة",
                      hintText: "0",
                      suffixList: ["سم"],
                    ),
                  ],
                ),
            },

            defaultButton(
              onTap: AppCubit.get(context).allQuestionsAnswered()
                  ? () {
                      // _updateProgress();
                      return Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NextTestScreen(
                            appbar:
                                "خطورة الاصابة بالرجفان الاذني والجلطة الدماغية",
                            progress: progress,
                            testNumber: testNumber,
                          ),
                        ),
                      );
                    }
                  : null,
              text: 'استمرار',
            ),
          ],
        ),
      ),
    );
  }
}

////// default text in this page

Widget defText({
  required final String text,
  final FontWeight weight = FontWeight.w600,
  final Color color = const Color(0xff1A0004),
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 16,
      fontWeight: weight,
      color: color,
    ),
  );
}

///////////////////////////////////////////
Widget yesOrNoQusions(
  context, {
  required final List<String> questionsText,
  // required final int questionIndex,
}) {
  List<int> questionsIndex = List.generate(
    questionsText.length,
    (listIndex) => (listIndex),
  );

  ////// this is the begin of the edit
  List<String> answers = ["نعم", "لا"];

  return ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: questionsText.length,
    itemBuilder: (context, buildIndex) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: defText(
            text: questionsText[buildIndex],
          ),
        ),
        GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 2 / 1,
          children: List.generate(
            2,
            (index) {
              return InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  AppCubit.get(context).yesOrNoClicked(
                    questionIndex: questionsIndex[buildIndex],
                    answerIndex: index,
                  );
                },
                child: Container(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: AppCubit.get(context)
                            .YorNQuestions[questionsIndex[buildIndex]][index]
                        ? mainColor100
                        : Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: AppCubit.get(context)
                              .YorNQuestions[questionsIndex[buildIndex]][index]
                          ? mainColor
                          : Color(0xffE8E8E8),
                      width: 1,
                    ),
                  ),
                  margin: EdgeInsets.all(4),
                  child: Center(
                    child: defText(
                      text: answers[index],
                      color: greyColor,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

////////////////////

