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
  return Padding(
    padding: EdgeInsets.only(
      bottom: subText == "" ? 25 : 15,
    ),
    child: InkWell(
      ////// to make the icon with no click effect
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icon,
                  width: 17,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    subText == ""
                        ? SizedBox()
                        : SizedBox(
                            height: 12,
                          ),
                    Text(
                      text,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    subText == ""
                        ? SizedBox()
                        : Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Text(
                              subText,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: mainColor,
                              ),
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
      ),
    ),
  );
}
