import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makeny/extentions/colors.dart';

Widget circleIcon({
  required final String icon,
  required final String topText,
  required final String bottomText,
  final bool withIcon = false,
}) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          // shape: BoxShape.circle,
          color: mainColor50,
        ),
        child: SvgPicture.asset(
          icon,
          width: 20,
          height: 20,
          color: Colors.black,
        ),
      ),
      Row(
        children: [
          Text(
            topText,
            style: TextStyle(
              color: mainColor,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          withIcon
              ? Row(
                  children: [
                    SizedBox(
                      width: 3,
                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xffF6D060),
                      size: 17,
                    ),
                  ],
                )
              : SizedBox(),
        ],
      ),
      Text(
        bottomText,
        style: TextStyle(
          color: mianBlack,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}
