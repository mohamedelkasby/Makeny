import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';

Widget defaultTextForm({
  required final String label,
  final String hintText = "",
  final Widget icon = const SizedBox(),
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 17,
          color: mianBlack,
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox(
        height: 5,
      ),
      TextFormField(
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
            borderSide: BorderSide(color: Colors.transparent),
          ),
          fillColor: Colors.white.withOpacity(.8),
          filled: true,

          ///////////
        ),
      ),
      SizedBox(
        height: 7,
      )
    ],
  );
}
