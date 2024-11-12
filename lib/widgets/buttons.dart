import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makeny/extentions/colors.dart';

// button for login and signup pages that have a smaller height than the default

Widget longSignButton({
  required final String text,
  required final Function() onTap,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: mainColor,
    ),
    width: double.infinity,
    height: 50,
    child: MaterialButton(
      onPressed: onTap,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

///////////////////// square button //////////////////

Widget squareButton({
  required final Function() onTap,
  final double size = 50,
  required final Widget widget,
  final Color color = Colors.white,
}) {
  return InkWell(
    //////// the color effect ontap  /////
    splashColor: Colors.transparent,
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

////////// default button for the rest of the App that have a infinite width ///

Widget defaultButton({
  required final String text,
  final double width = double.infinity,
  required final Function()? onTap,
  final bool reverseColors = false,
  // Color buttonColor = const Color(0xffFF3255),
}) {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: mainColor,
        ),
        borderRadius: BorderRadius.circular(5),
        color: onTap == null
            ? mainColor200
            : reverseColors
                ? Colors.white
                : mainColor,
      ),
      width: width,
      height: 54,
      child: MaterialButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: reverseColors ? mainColor : Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}
/////////////////////

Widget signButton({
  required final String text,
  required final String icon,
  required final Function() onTap,
}) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        border: Border.all(color: Colors.grey, width: 0.2),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            spreadRadius: -2, // Spread radius of the shadow
            blurRadius: 4, // Blur radius for smooth shadow
            offset: Offset(3, 4), // Shadow position
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              SvgPicture.asset(icon),
              // Image.asset(icon), // Alternative to the SvgPicture
            ],
          ),
        ),
      ),
    ),
  );
}

/////////// back arrow to make the size default for all //////
Widget backArrow(context) {
  return IconButton(
    onPressed: () => Navigator.pop(context),
    icon: Icon(
      Icons.arrow_back_ios_rounded,
      size: 20,
      ///////// how to change the weight of the iocn ////////
      // weight: 2.5,
    ),
  );
}
