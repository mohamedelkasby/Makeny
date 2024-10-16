import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makeny/extentions/colors.dart';

Widget serviseLinkWidgets({
  required final String img,
  required final String text,
  required final Function() onTap,
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
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    text,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ],
              ),
              Container(
                child: SvgPicture.asset("assets/icons/left.svg"),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
