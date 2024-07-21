import 'package:flutter/material.dart';

Widget UsersData({required String textType, required String textData}) {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
            text: "\u2022 ", style: TextStyle(fontSize: 16.0)), // Bullet point
        TextSpan(text: textType, style: TextStyle(fontSize: 22)),
        TextSpan(
            text: "/ $textData",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
        TextSpan(text: "\n", style: TextStyle(fontSize: 16.0)),
      ],
    ),
  );
}
