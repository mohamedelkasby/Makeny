import 'package:flutter/material.dart';

Widget UsersData({
  required String textType,
  required String textData,
}) {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: "\u2022 ",
          // style: TextStyle(
          //   fontSize: 18,
          // ),
        ), // Bullet point
        TextSpan(
          text: textType,
        ),
        TextSpan(
          text: "/ $textData",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
      style: TextStyle(
        fontSize: 18,
      ),
    ),
  );
}
