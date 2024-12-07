import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';

Widget serviseLinkWidgets({
  required final String img,
  required final String text,
  required final Function() onTap,
  required BuildContext context,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 14),
    child: InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: mainColor50, borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    img,
                    width: 50,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    text,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ],
              ),
              Icon(
                context.locale.toString() == "ar"
                    ? Icons.keyboard_arrow_left_rounded
                    : Icons.keyboard_arrow_right_rounded,
                color: greyborderColor,
              )
            ],
          ),
        ),
      ),
    ),
  );
}
