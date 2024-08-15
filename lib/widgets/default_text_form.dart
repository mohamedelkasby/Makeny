import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';

class DefaultTextForm extends StatelessWidget {
  const DefaultTextForm({
    super.key,
    this.hintText = "",
    this.label = "",
    this.icon = const SizedBox(),
    // this.value = "",
    this.controller,
  });

  final String label;
  final String hintText;
  final Widget icon;
  // final String value;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          Text(
            label,
            style: TextStyle(
              fontSize: 17,
              color: mainBlack,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 5),
        ],
        // label == ""
        //     ? SizedBox()
        //     : Column(
        //         children: [
        //           Text(
        //             label,
        //             style: TextStyle(
        //               fontSize: 17,
        //               color: mainBlack,
        //               fontWeight: FontWeight.w600,
        //             ),
        //           ),
        //           SizedBox(
        //             height: 5,
        //           ),
        //         ],
        //       ),
        TextFormField(
          controller: controller,
          // initialValue: value,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: icon,
            //////////
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: greyborderColor.withOpacity(.6),
              ),
            ),
            fillColor: Colors.white.withOpacity(.8),
            filled: true,

            ///////////
          ),
        ),
        if (label.isNotEmpty) SizedBox(height: 7),
      ],
    );
  }
}
