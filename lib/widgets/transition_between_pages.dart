import 'package:flutter/material.dart';

enum Direction {
  fromRight,
  fromLeft,
  fromTop,
  fromBottom,
}

Future<void> transitionBetweenPages(
  BuildContext context, {
  required Widget thePage,
  // bool fromRight = false,
  // bool fromBottom = false,
  // bool fromTop = false,
  // bool fromLeft = false,
  Direction direction = Direction.fromRight,
  Curve forwardCurve = Curves.easeOutBack,
  Curve reverseCurve = Curves.easeIn,
}) {
  return Navigator.push(
    context,
    PageRouteBuilder(
      barrierColor: Colors.black.withOpacity(.3),
      barrierDismissible: true,
      opaque: false,
      transitionDuration: Duration(milliseconds: 1000),
      reverseTransitionDuration: Duration(milliseconds: 700),
      pageBuilder: (context, animation, secondaryAnimation) => thePage,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        ////// define the start position .
        Offset begin;
        switch (direction) {
          case Direction.fromRight:
            begin = Offset(1.0, 0.0);
            break;
          case Direction.fromBottom:
            begin = Offset(0.0, 1.0);
            break;
          case Direction.fromTop:
            begin = Offset(0.0, -1.0);
            break;
          case Direction.fromLeft:
            begin = Offset(-1.0, 0.0);
            break;
        }
        const end = Offset(0.0, 0.0);

        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: animation.status == AnimationStatus.reverse
              ? reverseCurve
              : forwardCurve,
        );

        final offsetAnimation = Tween<Offset>(
          begin: begin,
          end: end,
        ).animate(curvedAnimation);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    ),
  );
}
