import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/defualt_appbar.dart';

class QualityOfLifeMeasureScreen extends StatelessWidget {
  const QualityOfLifeMeasureScreen({
    super.key,
    this.testNumber = 1,
  });
  final int testNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(
        context,
        title: "جودة الحياة",
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                padding: const EdgeInsets.all(
                  2,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: greyColor,
                      offset: const Offset(0, 1),
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
                      child: defalutQuestionText(text: "اختبار $testNumber/6"),
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
                          value: (testNumber / 6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
