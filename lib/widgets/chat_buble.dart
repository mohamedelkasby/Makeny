import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key,
    required this.message,
    required this.isSender,
    required this.time,
    this.isMessagePending = false,
    // required this.reciverImage,
  });

  final String message;
  final bool isSender;
  final String time;
  final bool isMessagePending;
  // final String reciverImage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          if (!isSender)
            const CircleAvatar(
              child: Icon(Icons.person),
            ),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            decoration: BoxDecoration(
              color: isSender
                  ? (isMessagePending
                      ? mainColor200.withOpacity(0.7)
                      : mainColor200)
                  : greyColor,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              alignment: WrapAlignment.end,
              spacing: 10,
              children: [
                Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white12,
                      ),
                    ),
                    if (isMessagePending && isSender) ...[
                      const SizedBox(width: 4),
                      const SizedBox(
                        width: 10,
                        height: 10,
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white70),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
