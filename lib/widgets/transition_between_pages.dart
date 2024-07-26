import 'package:flutter/material.dart';

Future<void> transitionBetweenPages(
  context, {
  required Widget thePage,
  bool fromRight = false,
  bool fromBottom = false,
  bool formtop = false,
  bool fromleft = false,
}) {
  return Navigator.push(
    context,
    PageRouteBuilder(
      barrierColor: Colors.black.withOpacity(.3),
      barrierDismissible: true,
      opaque: false,
      //the duration of transition
      transitionDuration: Duration(milliseconds: 1000),
      reverseTransitionDuration: Duration(milliseconds: 700),
      pageBuilder: (context, animation, secondaryAnimation) => thePage,
      transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
      ) {
        const right = Offset(1.0, 0.0); // Start from the right
        const left = Offset(-1.0, 0.0); // Start from the left
        const top = Offset(1.0, -1.0); // Start from the top
        const bottom = Offset(0.0, 1.0); // Start from the bottom
        const end = Offset(0.0, 0.0);
        const curve = Curves.easeOutBack;

        // const reverseBegin = Offset(0.0, 0.0);
        const reverseEnd = Offset(-1.0, 0.0); // End to the left
        const reverseCurve = Curves.easeIn;

        var tween = Tween(
          begin: fromBottom
              ? bottom
              : fromleft
                  ? left
                  : formtop
                      ? top
                      : right,
          end: end,
        ).chain(
          CurveTween(curve: curve),
        );
        //////// reverse Tween
        var reverseTween = Tween(
          begin: end,
          end: right,
        ).chain(
          CurveTween(curve: reverseCurve),
        );
        /////// reverse animation
        var offsetAnimation = animation.drive(
          tween,
        );
        //////// revers offset
        var reverseOffsetAnimation = secondaryAnimation.drive(
          reverseTween,
        );
        return SlideTransition(
          position: animation.status == AnimationStatus.reverse
              ? reverseOffsetAnimation
              : offsetAnimation,
          child: child,
        );
      },
    ),
  );
}
