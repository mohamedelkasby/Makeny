import 'package:flutter/material.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/danger_measure_tests/body_test_num6/second_page.dart';
import 'package:makeny/widgets/danger_measure_tests/body_test_num6/switch_body_num6.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/green_note.dart';
import 'package:makeny/widgets/questions_type/long_one_answer_check.dart';

class MultidimensionalDyspneaScaleScreen extends StatefulWidget {
  const MultidimensionalDyspneaScaleScreen({
    super.key,
    required this.appbar,
  });
  final String appbar;

  @override
  State<MultidimensionalDyspneaScaleScreen> createState() =>
      _MultidimensionalDyspneaScaleScreenState();
}

class _MultidimensionalDyspneaScaleScreenState
    extends State<MultidimensionalDyspneaScaleScreen> {
  int bodyIndex = 0;
  String? selectedAnswer;

  @override
  void initState() {
    bodyIndex = 0;
    selectedAnswer = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> greenText = [
      "يرجي وضع علامة على مجموعة واحدة تصف بدقة كيف تشعر أو شعرت خلال التنفس.",
      "لقد قمت بختيار هذا المجموعة حيث انها اكثر واحدة تصف بدقة كيف تشعر خلال تنفسك ",
      "عندما يكون تنفسك غير طبيعي قد تواجه بعض المشاعر أو العواطف، وباستخدام المقياس أدناه يرجي تزودينا بالمشاعر التي شعرت بها خلال تنفسك ويمكنك استخدام القيمة - صفر- عندما ترى أن المشاعر لا تنطبق عليك.",
    ];
    List<String> normalText = [
      "إذا انطبق عليك أيّ مصطلح في المجموعة، اختر تلك المجموعة.",
      "الان استخدام هذه المقاييس لتقييم ما مدي  شدة الاحساس بالتنفس التي تشعر أو شعرت  بها",
      ""
    ];
    return Scaffold(
      appBar: defaultAppbar(context, title: widget.appbar),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Stack(
          children: [
            ListView(
              children: [
                greenNote(
                  text: greenText[bodyIndex],
                ),
                normalText[bodyIndex] == ""
                    ? SizedBox()
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: defalutQuestionText(
                          text: normalText[bodyIndex],
                        ),
                      ),
                bodyIndex == 0
                    // first Page
                    ? LongOneAnswerCheck(
                        questionText: "",
                        answers: [
                          "يشق عليّ التنفس ويتطلب مني جهدًا عضليًا.",
                          "لا أحصل على كمية كافية من الهواء وأشعر بالاختناق أو أشعر بالحاجة إلى الهواء.",
                          "أشعر بالضيق أو الانقباض في صدري.",
                          "يتطلب تنفسي جهدًا ذهنيًا أو تركيزًا.",
                          "أتنفس كثيرًا.",
                        ],
                        ///// on answer sellected.
                        onAnswerSelected: (String answer) {
                          setState(() {
                            selectedAnswer = answer;
                          });
                        },
                      )
                    : switchBodyNum6(
                        bodyIndex,
                        selectedAnswer: selectedAnswer,
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
              child: bodyIndex < 2
                  ? defaultButton(
                      text: "استمرار",
                      onTap: selectedAnswer != null
                          ? () {
                              setState(() {
                                bodyIndex++;
                              });
                            }
                          : null,
                    )
                  : defaultButton(
                      text: "التالى",
                      onTap: () {},
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
