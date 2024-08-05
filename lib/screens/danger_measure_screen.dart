import 'package:flutter/material.dart';
// import 'package:makeny/cubit/cubit.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/next_test_screen.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/switch_widget.dart';

class DangerMeasureScreen extends StatefulWidget {
  DangerMeasureScreen({
    super.key,
    required this.appbar,
    this.progress = (1 / 7),
    this.testNumber = 1,
    // this.yesOrNoQuestions = const [],
  });
  final String appbar;
  // final List<String> yesOrNoQuestions;
  int testNumber;
  double progress;
  @override
  State<DangerMeasureScreen> createState() => _DangerMeasureScreenState();
}

class _DangerMeasureScreenState extends State<DangerMeasureScreen> {
  /////// if the number of questions was not as the this variable it will give error
  // final int numberOfQuestions = ;
  // List<String> yesOrNoQuestions = widget.yesOrNoQuestions;
  List<List<String>> questionsOfPage = [
    ["هل تدخن؟"],
    ["هل لديك امراض مزمنة؟"],
    [
      "هل تنومت في المستشفي خلال  الشهر الماضي بسبب القلب؟",
      "هل تعاني من الشخير ؟",
      "هل تعاني من الصداع في الصباح ؟",
      "هل تعاني من جفاف في الحلق عند الاستيقاظ من النوم ؟",
      "هل تعاني من صعوبة في النوم او النعاس دائما ؟",
      "هل تعاني من ضعف في التركيز ؟",
      "هل تعاني من الاختناق الليلي ؟",
      "هل تحتاج اجهزة مساعدة عند النوم ؟",
    ],
    [],
    [],
    [],
    [],
  ];
  @override
  void initState() {
    super.initState();

    //// this to make when enter the page the default value of wright and false will be false
    // AppCubit.get(context)
    //     .initializeQuestions(questionsOfPage[widget.testNumber - 1].length);
  }

  @override
  Widget build(BuildContext context) {
    final int testNumber = widget.testNumber;
    final double progress = widget.progress;
    final String appbar = widget.appbar;

    print("Current test number: $testNumber");

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: defaultAppbar(context, title: appbar),
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

            /////// the yes or no question ////
            switchPagesTest(
              context,
              testNumber: testNumber,
              yesOrNoQuestions: questionsOfPage[widget.testNumber - 1],
            ),
            defaultButton(
              onTap: () {
                // _updateProgress();
                return Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NextTestScreen(
                      appbar: switchAppbar(testNumber: testNumber),
                      progress: progress,
                      testNumber: testNumber,
                    ),
                  ),
                );
              },
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
  final TextAlign align = TextAlign.start,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 16,
      fontWeight: weight,
      color: color,
    ),
    textAlign: align,
  );
}

///////////////////////////////////////////

class YesOrNoQustions extends StatefulWidget {
  const YesOrNoQustions({super.key, required this.questionsText});

  @override
  State<YesOrNoQustions> createState() => _YesOrNoQustionsState();
  final List<String> questionsText;
}

class _YesOrNoQustionsState extends State<YesOrNoQustions> {
  @override
  Widget build(BuildContext context) {
    List<String> answers = ["نعم", "لا"];
    List<String> questionsText = widget.questionsText;
    List<int> questionsIndex = List.generate(
      questionsText.length,
      (listIndex) => (listIndex),
    );
    Color bordercolor = Color(0xffE8E8E8);
    Color backgroundColor = Colors.white;

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
                    // AppCubit.get(context).yesOrNoClicked(
                    //   questionIndex: questionsIndex[buildIndex],
                    //   answerIndex: index,
                    // );
                    setState(() {
                      bordercolor = bordercolor == Colors.white
                          ? mainColor
                          : Color(0xffE8E8E8);
                      backgroundColor = backgroundColor == Color(0xffE8E8E8)
                          ? mainColor100
                          : Colors.white;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      color:
                          // AppCubit.get(context)
                          //         .YorNQuestions[questionsIndex[buildIndex]][index]
                          backgroundColor,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color:
                            // AppCubit.get(context)
                            //         .YorNQuestions[questionsIndex[buildIndex]][index]
                            bordercolor,
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
}

/////////////////////////////////////////
///
class OneAnswerCheck extends StatefulWidget {
  const OneAnswerCheck({
    super.key,
    required this.questionsText,
    this.answers = const [],
  });

  @override
  State<OneAnswerCheck> createState() => _OneAnswerCheckState();
  final String questionsText;
  final List<String> answers;
}

class _OneAnswerCheckState extends State<OneAnswerCheck> {
  @override
  Widget build(BuildContext context) {
    String questionsText = widget.questionsText;

    List<int> questionsIndex = List.generate(
      questionsText.length,
      (listIndex) => (listIndex),
    );

    Color bordercolor = Color(0xffE8E8E8);
    Color backgroundColor = Colors.white;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 8),
          child: defText(
            text: questionsText,
          ),
        ),
        GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 2 / 1,
          children: List.generate(
            widget.answers.length,
            (index) {
              return InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    bordercolor = bordercolor == Colors.white
                        ? mainColor
                        : Color(0xffE8E8E8);
                    backgroundColor = backgroundColor == Color(0xffE8E8E8)
                        ? mainColor100
                        : Colors.white;
                  });
                },
                child: Container(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: bordercolor,
                      width: 1,
                    ),
                  ),
                  margin: EdgeInsets.all(4),
                  child: Center(
                    child: defText(
                      text: widget.answers[index],
                      color: greyColor,
                      align: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}


////////////////////

