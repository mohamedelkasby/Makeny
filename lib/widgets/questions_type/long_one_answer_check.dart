import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';

class LongOneAnswerCheck extends StatefulWidget {
  const LongOneAnswerCheck({
    super.key,
    required this.questionText,
    this.answers = const [],
    required this.onAnswerSelected,
    this.payment = false,
  });
  final bool payment;
  final String questionText;
  final List<String> answers;
  final Function(String) onAnswerSelected;

  @override
  State<LongOneAnswerCheck> createState() => _LongOneAnswerCheckState();
}

class _LongOneAnswerCheckState extends State<LongOneAnswerCheck> {
  late String questionText = widget.questionText;
  late List<String> answers = widget.answers;
  int? selectedAnswer;

  @override
  void initState() {
    selectedAnswer = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        questionText == ""
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(top: 15),
                child: defalutQuestionText(
                  text: questionText,
                ),
              ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: answers.length,
          itemBuilder: (context, index) {
            bool isSelected = selectedAnswer == index;
            return InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  selectedAnswer = index;
                });
                widget.onAnswerSelected(answers[index]);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: widget.payment ? 70 : 80,
                decoration: BoxDecoration(
                  color: isSelected ? mainColor50 : Colors.white,
                  borderRadius: BorderRadius.circular(widget.payment ? 20 : 15),
                  border: Border.all(
                    color: isSelected ? mainColor : const Color(0xffE8E8E8),
                  ),
                ),
                child: widget.payment
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          isSelected
                              ? SvgPicture.asset("assets/icons/checked_box.svg")
                              : SvgPicture.asset(
                                  "assets/icons/unchecked_box_gray.svg",
                                ),
                          SizedBox(
                            width: 5,
                          ),
                          defalutQuestionText(
                            text: answers[index],
                            color: isSelected ? mainColor300 : greyColor,
                            align: TextAlign.center,
                          ),
                        ],
                      )
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: defalutQuestionText(
                            text: answers[index],
                            color: greyColor,
                            align: TextAlign.center,
                          ),
                        ),
                      ),
              ),
            );
          },
        ),
      ],
    );
  }
}
