import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/chat_with_doctor.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';

PreferredSizeWidget defaultAppbar(
  final context, {
  required final String title,
  bool goChat = false,
}) {
  return AppBar(
    actions: [
      goChat
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: mainColor50,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: SvgPicture.asset("assets/icons/chat.svg"),
                  ),
                ),
              ),
            )
          : SizedBox()
    ],
    leading: backArrow(context),
    centerTitle: true,
    title: textNormal(
      text: title,
    ),
    bottom: PreferredSize(
      preferredSize: Size(double.infinity, 2),
      child: Container(
        height: 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: [.2, .5, .8],
            colors: [
              Color(0xffE8E8E8),
              Color(0xffee5534),
              Color(0xffE8E8E8),
            ],
          ),
        ),
      ),
    ),
  );
}
