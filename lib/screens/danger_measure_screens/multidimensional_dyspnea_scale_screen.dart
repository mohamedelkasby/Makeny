import 'package:flutter/material.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/danger_measure_tests/body_test_num6/switch_body_num6.dart';
import 'package:makeny/widgets/defualt_appbar.dart';

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

  @override
  void initState() {
    bodyIndex = 0;
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
            Column(
              children: [
                _defGreenContainer(
                  text: greenText[bodyIndex],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: defalutQuestionText(
                    text: normalText[bodyIndex],
                  ),
                ),
                switchBodyNum6(bodyIndex),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: bodyIndex < 2
                  ? defaultButton(
                      text: "استمرار",
                      onTap: () {
                        setState(() {
                          bodyIndex++;
                        });
                      },
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

Widget _defGreenContainer({
  required String text,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Color(0xffD0FFBF),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 10,
      ),
      child: defalutQuestionText(
        text: text,
      ),
    ),
  );
}
