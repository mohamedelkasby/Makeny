import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makeny/cubits/cubit.dart';
import 'package:makeny/cubits/status.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';

class YesOrNoQuestions extends StatefulWidget {
  const YesOrNoQuestions({
    super.key,
    required this.questionsText,
    this.onAnswersChanged,
    required this.onAllQuestionsAnswered,
  });
  final List<String> questionsText;
  final Function(List<int?>)? onAnswersChanged;
  final Function(bool) onAllQuestionsAnswered;

  @override
  State<YesOrNoQuestions> createState() => _YesOrNoQustionsState();
}

class _YesOrNoQustionsState extends State<YesOrNoQuestions> {
  late final List<int?> selectedAnswers;

  // bool areAllQuestionsAnswered() {
  //   return !selectedAnswers.contains(null);
  // }

  @override
  void initState() {
    super.initState();
    selectedAnswers = List.filled(widget.questionsText.length, null);
  }

  List<String> answers = ["نعم", "لا"];

  @override
  Widget build(BuildContext context) {
    List<String> questionsText = widget.questionsText;

    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: questionsText.length,
          itemBuilder: (context, questionIndex) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: defalutQuestionText(
                  text: questionsText[questionIndex],
                ),
              ),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 2 / 1,
                children: List.generate(
                  answers.length,
                  (answersIndex) {
                    bool isSelected =
                        selectedAnswers[questionIndex] == answersIndex;
                    return InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        //cubit.
                        AppCubit.get(context).selectAnswer(
                            selectedAnswers: selectedAnswers,
                            questionIndex: questionIndex,
                            answersIndex: answersIndex);
                        //cubit.
                        AppCubit.get(context).checkTheCheckedAnswer(
                          onAnswersChanged: widget.onAnswersChanged,
                          selectedAnswers: selectedAnswers,
                        );
                        widget.onAllQuestionsAnswered(
                          //cubit.
                          AppCubit.get(context)
                              .areAllQuestionsAnswered(selectedAnswers),
                        );
                        // context.read<AppCubit>();
                        print(selectedAnswers);
                      },
                      child: Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          color: isSelected ? mainColor50 : Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: isSelected
                                ? mainColor
                                : const Color(0xffE8E8E8),
                            width: 1,
                          ),
                        ),
                        margin: const EdgeInsets.all(4),
                        child: Center(
                          child: defalutQuestionText(
                            text: answers[answersIndex],
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
      },
    );
  }
}
