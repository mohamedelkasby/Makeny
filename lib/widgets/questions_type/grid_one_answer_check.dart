import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';

class GridOneAnswerCheck extends StatefulWidget {
  const GridOneAnswerCheck({
    super.key,
    required this.questionsText,
    this.answers = const [],
  });

  @override
  State<GridOneAnswerCheck> createState() => _GridOneAnswerCheckState();
  final String questionsText;
  final List<String> answers;
}

class _GridOneAnswerCheckState extends State<GridOneAnswerCheck> {
  late int? selectedAnswers; //

  @override
  void initState() {
    super.initState();
    selectedAnswers = null; //
  }

  Color bordercolor = Color(0xffE8E8E8);
  Color backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    String questionsText = widget.questionsText;

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
            (answersIndex) {
              bool isSelected = selectedAnswers == answersIndex;
              return InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    selectedAnswers = answersIndex;
                    // bordercolor = bordercolor == Colors.white
                    //     ? mainColor
                    //     : Color(0xffE8E8E8);
                    // backgroundColor = backgroundColor == Color(0xffE8E8E8)
                    //     ? mainColor100
                    //     : Colors.white;
                  });
                },
                child: Container(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: isSelected ? mainColor50 : Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: isSelected ? mainColor : Color(0xffE8E8E8),
                      width: 1,
                    ),
                  ),
                  margin: EdgeInsets.all(4),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: defalutQuestionText(
                        text: widget.answers[answersIndex],
                        color: greyColor,
                        align: TextAlign.center,
                      ),
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
