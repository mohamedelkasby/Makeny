import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';

// button for login and signup pages that have a smaller height than the default

Widget longSignButton({
  required String text,
  required Function() onTap,
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

////////// default button for the rest of the App that have a infinite width ///

Widget defaultButton({
  required String text,
  double width = double.infinity,
  required Function() onTap,
  //        ////    change the color with the mainColor that is defined earlier
  // Color buttonColor = const Color(0xffFF3255),
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: mainColor,
    ),
    width: width,
    height: 54,
    child: MaterialButton(
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 23,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
/////////////////////

Widget signButton({
  required String text,
  required String icon,
  required Function() onTap,
}) {
  return Expanded(
    child: ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          ContinuousRectangleBorder(
            side: BorderSide(color: Colors.grey, width: .2),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 11),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Image.asset(icon),
        ],
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
