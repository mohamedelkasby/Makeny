import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makeny/extentions/colors.dart';

Widget textIconNavigator({
  required final String icon,
  required final String text,
  final String subText = "",
  final bool showIcon = true,
  required final Function() onTap,
}) {
  return InkWell(
    borderRadius: BorderRadius.circular(10),
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: SvgPicture.asset(
                icon,
                width: 17,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                subText == ""
                    ? SizedBox()
                    : Text(
                        subText,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: mainColor,
                        ),
                      )
              ],
            ),
          ],
        ),
        showIcon == true
            ? Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
                color: Color(0xffA2A2A2),
              )
            : SizedBox()
      ],
    ),
  );
}
