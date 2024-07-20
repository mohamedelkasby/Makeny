import 'package:flutter/material.dart';

Widget signButton({
  required String text,
  required String icon,
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
      onPressed: () {},
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
