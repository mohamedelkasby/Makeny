import 'package:flutter/material.dart';

Widget defaultPageView(
  final context, {
  required final String image,
  required final String text,
}) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          height: MediaQuery.sizeOf(context).height * .49,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: MediaQuery.sizeOf(context).height * .09,
                left: MediaQuery.sizeOf(context).width * .15,
                child: Image.asset(
                  'assets/definition/Vector (2).png',
                  width: MediaQuery.sizeOf(context).width * .76,
                  height: MediaQuery.sizeOf(context).height * .4,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Image.asset(
                image,
                width: double.infinity,
                height: double.infinity,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * .01,
            horizontal: MediaQuery.sizeOf(context).width * .047,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    ),
  );
}
