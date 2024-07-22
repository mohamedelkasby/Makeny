import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
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
          stops: [.1, .5, .9],
          colors: [
            mainColor50,
            mainColor,
            mainColor50,
          ],
        )),
      ),
    ),
  );
}
