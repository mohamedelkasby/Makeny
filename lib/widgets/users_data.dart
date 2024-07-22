import 'package:flutter/material.dart';

Widget UsersData({
  required String textType,
  required String textData,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "\u2022 ",
          ), // Bullet point
          TextSpan(
            text: "$textType /",
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: "  $textData",
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    ),
  );
}
