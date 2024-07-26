import 'package:flutter/material.dart';

Widget centerImge({
  required String img,
}) {
  return Align(
    alignment: Alignment.center,
    child: Image.asset(
      img,
      height: 150,
    ),
  );
}
