import 'package:flutter/material.dart';

Widget textHeader({
  required final String text,
  Color textColor = const Color(0xff0D1B34),
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w800,
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

Widget textNormal({
  required final String text,
  Color textColor = const Color(0xff0D1B34),
}) {
  return Text(
    text,
    style:
        TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: textColor),
  );
}
