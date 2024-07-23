import 'package:flutter/material.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';

PreferredSizeWidget defaultAppbar(
  final context, {
  required final String title,
}) {
  return AppBar(
    leading: backArrow(context),
    centerTitle: true,
    title: textNormal(
      text: title,
    ),
    bottom: PreferredSize(
      preferredSize: Size(double.infinity, 2),
      child: Container(
        height: 2,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          stops: [.2, .5, .8],
          colors: [
            Color(0xffE8E8E8),
            Color(0xffee5534),
            Color(0xffE8E8E8),
          ],
        )),
      ),
    ),
  );
}
