import 'package:flutter/material.dart';

Widget UsersData(
    {required String textType,
    required String textData,
    String seperator = "/"}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Text.rich(
      TextSpan(
        children: [
          // Bullet point
          TextSpan(
            text: "\u2022 $textType $seperator",
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: "  $textData",
            style: TextStyle(
              fontWeight:
                  seperator == "/" ? FontWeight.w700 : FontWeight.normal,
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
