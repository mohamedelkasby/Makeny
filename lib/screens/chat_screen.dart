import 'package:flutter/material.dart';
import 'package:makeny/widgets/defualt_appbar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: defaultAppbar(context, title: "المساعد الذكي"),
      ),
    );
  }
}
