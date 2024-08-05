import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';

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

    Color bordercolor = Color(0xffE8E8E8);
    Color backgroundColor = Colors.white;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 8),
          child: defalutQuestionText(
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
                    child: defalutQuestionText(
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
