import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';

class CustomListField extends StatefulWidget {
  final List<String> suffixList;
  final String suffixText;
  final Widget suffixIcon;
  final bool enable;
  final String qustionText;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;

  const CustomListField({
    super.key,
    this.suffixList = const [],
    this.enable = true,
    this.suffixText = "",
    required this.qustionText,
    this.hintText = "",
    this.suffixIcon = const SizedBox(),
    this.keyboardType = const TextInputType.numberWithOptions(),
    required this.controller,
  });

  @override
  State<CustomListField> createState() => _CustomListFieldState();
}

class _CustomListFieldState extends State<CustomListField> {
  String selectedList = "";
  final _formKey = GlobalKey<FormFieldState>();
  String? errorMessage;

  @override
  void initState() {
    if (widget.suffixList.isNotEmpty) {
      selectedList = widget.suffixList[0];
    }
    super.initState();
  }

  // Validate function
  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      errorMessage = "من فضلك ادخل ${widget.qustionText}";
      return errorMessage;
    }
    errorMessage = null;

    return null;
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
        TextFormField(
          key: _formKey,
          onChanged: (value) {
            // Trigger validation on each change
            setState(() {
              _validateInput(value);
            });
          },
          validator: _validateInput,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          enabled: widget.enable,
          // Add autovalidateMode to enable real-time validation
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: greyColor,
            ),
            filled: widget.enable ? false : true,
            fillColor: greyborderColor.withOpacity(.2),
            isDense: true,
            // Change border color based on error state
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: errorMessage != null ? Colors.red : greyborderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: errorMessage != null ? Colors.red : mainColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            // Show error message
            errorText: errorMessage,
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
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                        ),
                        value: selectedList,
                        style: TextStyle(
                          fontSize: 16,
                          color: greyColor,
                          fontFamily: "cairo",
                          fontWeight: FontWeight.w300,
                        ),
                        underline: SizedBox(),
                        items: widget.suffixList.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedList = newValue!;
                          });
                        },
                      )
                    : widget.suffixIcon,
            suffixIconConstraints:
                const BoxConstraints(minHeight: 0, minWidth: 0),
          ),
        ),
      ],
    );
  }
}
