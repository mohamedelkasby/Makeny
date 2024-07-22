import 'package:flutter/material.dart';
import 'package:makeny/cubit/cubit.dart';
import 'package:makeny/extentions/colors.dart';

Widget iconWithLabel(
  final context, {
  required final IconData icon,
  required final String label,
  final int indexNumber = 2,
  final Color color = Colors.grey,
  required final Function() onTap,
}) {
  return InkWell(
    ////////  make the color effect transparent when short tap
    splashColor: Colors.transparent,
    ////////  make the color effect transparent when long tap
    highlightColor: Colors.transparent,
    onTap: onTap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: AppCubit.get(context).selectedBNBIndex == indexNumber
              ? mainColor
              : color,
          size: 32,
        ),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppCubit.get(context).selectedBNBIndex == indexNumber
                ? mainColor
                : color,
          ),
        )
      ],
    ),
  );
}
