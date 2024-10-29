import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';

class CustomDropDwonList extends StatefulWidget {
  const CustomDropDwonList({
    super.key,
    required this.listItems,
    required this.label,
    required this.onChanged,
    this.selectedValue,
  });
  final List<String> listItems;
  final String label;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;

  @override
  State<CustomDropDwonList> createState() => _CustomDropDwonListState();
}

class _CustomDropDwonListState extends State<CustomDropDwonList> {
  // late List<String> gender = widget.listItems;
  // late String selectedList = gender[0];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: defalutQuestionText(text: widget.label),
        ),
        Container(
          width: double.infinity,
          // margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: const Color(0xffcfcfd0)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DropdownButton<String>(
                isExpanded:
                    true, // هذا سيسمح للـ DropdownButton بأخذ العرض الكامل للـ Container
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                value: widget.selectedValue,
                style: TextStyle(
                  fontSize: 16,
                  color: mainBlack,
                  fontFamily: "cairo",
                  fontWeight: FontWeight.w400,
                ),
                underline: const SizedBox(),
                items: widget.listItems.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(value),
                    ),
                  );
                }).toList(),
                onChanged: widget.onChanged),
          ),
        ),
      ],
    );
  }
}
