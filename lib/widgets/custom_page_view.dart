import 'package:flutter/material.dart';

enum Direction {
  fromLeft,
  center,
  fromRight,
}

Widget customPageView({
  required final String text,
  required final Function() onTap,
  final Direction direction = Direction.center,
}) {
  double? left = null;
  double? right = null;
  switch (direction) {
    case Direction.fromLeft:
      left = 20;
      right = null;
    case Direction.center:
      left = 90;
      right = null;
    case Direction.fromRight:
      left = null;
      right = 20;
  }
  return InkWell(
    onTap: onTap,
    child: Stack(
      children: [
        Positioned(
          bottom: 50,
          left: left,
          right: right,
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
    ),
  );
}
