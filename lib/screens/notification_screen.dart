import 'package:flutter/material.dart';
import 'package:makeny/widgets/defualt_appbar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(context, title: "الإشعارات"),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
