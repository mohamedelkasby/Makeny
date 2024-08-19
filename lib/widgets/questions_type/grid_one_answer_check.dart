import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';

class GridOneAnswerCheck extends StatelessWidget {
  const GridOneAnswerCheck({
    super.key,
    required this.questionsText,
    required this.answers,
    this.selectedAnswer,
    required this.onAnswerSelected,
  });

  final String questionsText;
  final List<String> answers;
  final int? selectedAnswer;
  final Function(int) onAnswerSelected;

  @override
  Widget build(BuildContext context) {
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
            answers.length,
            (answersIndex) {
              bool isSelected = selectedAnswer == answersIndex;
              return InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () => onAnswerSelected(answersIndex),
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
                        text: answers[answersIndex],
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
