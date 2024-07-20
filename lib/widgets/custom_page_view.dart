import 'package:flutter/material.dart';

Widget customPageView({
  required String text,
  double fromLeft = 0,
  double fromRight = 0,
}) {
  return Stack(
    children: [
      Positioned(
        bottom: 50,
        left: fromLeft == 0 ? null : fromLeft,
        right: fromRight == 0 ? null : fromRight,
        child: Image.asset(
          "assets/designs/Vector.png",
          width: 220,
        ),
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
          ),
        ),
      ),
    ],
  );
}
