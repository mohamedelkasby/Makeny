import 'package:flutter/material.dart';

Widget longButton({
  required String text,
  double width = double.infinity,
  required Function() onTap,
  Color textColor = Colors.white,
  //        //        //        change the color with the mainColor that is defined earlier
  Color buttonColor = const Color(0xffFF3255),
  // const Color(0xffff56462)
}) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: buttonColor,
      ),
      width: width,
      height: 50,
      child: MaterialButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

///////////////////// square button //////////////////

Widget squareButton({
  required Function() onTap,
  double size = 50,
  required Widget widget,
  Color color = Colors.white,
}) {
  return InkWell(
    onTap: onTap,
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle,
            color: color,
          ),
          width: size,
          height: size,
        ),
        Positioned(left: size / 4, top: size / 4, child: widget),
      ],
    ),
  );
}
