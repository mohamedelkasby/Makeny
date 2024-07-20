import 'package:flutter/material.dart';

Widget defaultPageView(
  context, {
  required String image,
  required String text,
}) {
  return Column(
    children: [
      Container(
        alignment: Alignment.topCenter,
        height: 370,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 60,
              left: 70,
              child: Image.asset(
                'assets/definition/Vector (2).png',
                width: 300,
                height: 300,
                fit: BoxFit.fitWidth,
              ),
            ),
            Image.asset(
              image,
              width: double.infinity,
              height: double.infinity,
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
        ),
      ),
    ],
  );
}
