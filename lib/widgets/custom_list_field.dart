import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';

class CustomListField extends StatefulWidget {
  final List<String> suffixList;
  final String suffixText;
  final bool enable;
  final String qustionText;
  final String hintText;

  const CustomListField({
    super.key,
    this.suffixList = const [],
    this.enable = true,
    this.suffixText = "",
    required this.qustionText,
    this.hintText = "",
  });

  @override
  State<CustomListField> createState() => _CustomListFieldState();
}

class _CustomListFieldState extends State<CustomListField> {
  // String? errorMessage;
  String selectedList = "";

  @override
  void initState() {
    if (widget.suffixList.isNotEmpty) {
      selectedList = widget.suffixList[0];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: defalutQuestionText(text: widget.qustionText),
        ),
        //////// text field
        TextField(
          // onChanged: (value) {
          //   value.isNotEmpty?
          // },

          keyboardType: TextInputType.numberWithOptions(),
          enabled: widget.enable,
          decoration: InputDecoration(
            //// hint text and the style of hint text
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: greyColor,
            ),

            /// if i put the text feild enabled false it will change the color
            filled: widget.enable ? false : true,
            fillColor: greyborderColor.withOpacity(.2),
            isDense: true,
            // the border without been active
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: greyborderColor,
              ),
            ),

            /// the border that is active
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: mainColor,
            )),
            //// the border by default
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            //// the drop down button with the list
            suffixIcon: widget.suffixText != ""
                ? Directionality(
                    textDirection: TextDirection.ltr,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: defalutQuestionText(
                        text: widget.suffixText,
                        color: greyColor,
                        weight: FontWeight.w300,
                      ),
                    ),
                  )
                : widget.suffixList.isNotEmpty
                    ? DropdownButton<String>(
                        //// the icon that in the drop down list
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                        ),
                        //// the value of the choosen in the list
                        value: selectedList,
                        //// the style of the drop down list
                        style: TextStyle(
                          fontSize: 16,
                          color: greyColor,
                          fontFamily: "cairo",
                          fontWeight: FontWeight.w300,
                        ),
                        //// remove the under line of the suffex
                        underline: SizedBox(),
                        ////// the items in the list
                        items: widget.suffixList.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedList = newValue!;
                            // print(selectedList);
                          });
                        },
                      )
                    : SizedBox(),
            ////
            suffixIconConstraints:
                const BoxConstraints(minHeight: 0, minWidth: 0),
          ),
        ),
      ],
    );
  }
}
