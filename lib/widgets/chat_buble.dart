import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key, required this.message, required this.isSender});
  final String message;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSender ? mainColor200 : greyColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
