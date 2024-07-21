import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makeny/extentions/colors.dart';

Widget textIconNavigator({
  required String icon,
  required String text,
  String subText = "",
  bool showIcon = true,
  required Function() onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SvgPicture.asset(
                  icon,
                  width: 25,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                  subText == ""
                      ? SizedBox()
                      : Text(subText,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: mainColor))
                ],
              ),
            ],
          ),
          showIcon == true
              ? Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20,
                  color: Color(0xffA2A2A2),
                )
              : SizedBox()
        ],
      ),
    ),
  );
}
