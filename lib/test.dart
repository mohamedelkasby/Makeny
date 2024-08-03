import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/danger_measure_screen.dart';

void main(List<String> args) {
  runApp(YesOrNoQustions(
    questionsText: ["dfsdfsd", "sdfsdf"],
  ));
}

class YesOrNoQustions extends StatefulWidget {
  const YesOrNoQustions({super.key, required this.questionsText});

  @override
  State<YesOrNoQustions> createState() => _YesOrNoQustionsState();
  final List<String> questionsText;
}

class _YesOrNoQustionsState extends State<YesOrNoQustions> {
  late List<List<Color>> borderColor;
  late List<List<Color>> backgroundColor;

  @override
  void initState() {
    super.initState();
    // Initialize the colors for each question and each answer
    borderColor = List.generate(
      widget.questionsText.length,
      (_) => [Colors.white, Colors.white],
    );
    backgroundColor = List.generate(
      widget.questionsText.length,
      (_) => [Color(0xffE8E8E8), Color(0xffE8E8E8)],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> answers = ["نعم", "لا"];
    List<String> questionsText = widget.questionsText;

    return MaterialApp(
      home: Scaffold(
          body: ListView.builder(
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
                      setState(() {
                        borderColor[buildIndex][index] =
                            borderColor[buildIndex][index] == Colors.white
                                ? mainColor
                                : Colors.white;
                        backgroundColor[buildIndex][index] =
                            backgroundColor[buildIndex][index] ==
                                    Color(0xffE8E8E8)
                                ? mainColor100
                                : Color(0xffE8E8E8);
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: backgroundColor[buildIndex][index],
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: borderColor[buildIndex][index],
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
      )),
    );
  }
}
