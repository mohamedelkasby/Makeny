import 'package:flutter/material.dart';

Widget textHeader({
  required final String text,
  Color textColor = const Color(0xff0D1B34),
  bool wrap = false,
}) {
  return Text(
    overflow: wrap ? TextOverflow.ellipsis : null,
    maxLines: 1,
    text,
    style: TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.w800,
      color: textColor,
    ),
  );
}

////////////////////////////
Widget textHeaderLight({
  required final String text,
  Color textColor = const Color(0xff0D1B34),
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: textColor,
    ),
  );
}

//////////////////
Widget textHeaderDescription({
  required final String text,
  Color textColor = const Color(0xff0D1B34),
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: textColor,
    ),
  );
}

//////////////////
Widget textHeadLine({
  required final String text,
  Color textColor = const Color(0xff0D1B34),
}) {
  return Text(
    text,
    style:
        TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: textColor),
  );
}

////////////////
Widget textNormal({
  required final String text,
  Color textColor = const Color(0xff0D1B34),
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: textColor,
    ),
  );
}

///////////////////////
Widget textDescription({
  required final String text,
  Color textColor = const Color(0xff0D1B34),
}) {
  return Text(
    text,
    style: TextStyle(
      color: textColor,
      fontSize: 17,
      fontWeight: FontWeight.w400,
      height: 1.8,
    ),
  );
}
//////////////// text that build the qustions pages/////

Widget defalutQuestionText({
  required final String text,
  final FontWeight weight = FontWeight.w600,
  final Color color = const Color(0xff1A0004),
  final TextAlign align = TextAlign.start,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 16,
      fontWeight: weight,
      color: color,
    ),
    textAlign: align,
  );
}
