import 'package:flutter/material.dart';

Widget usersData({
  required String textType,
  String? textData,
  String seperator = "/",
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      // TextSpan(
      children: [
        // Bullet point
        Text(
          "\u2022 $textType $seperator",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        Text(
          "  $textData",
          style: TextStyle(
            fontWeight: seperator == "/" ? FontWeight.w700 : FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ],

      // ),
    ),
  );
}
