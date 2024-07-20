import 'package:flutter/material.dart';

void main() {
  runApp(test());
}

class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('PageView with Lines')),
        body: Center(
          child: FadeTransition(
            child: Text(
              "hhhh",
              style: TextStyle(fontSize: 50),
            ),
            opacity: kAlwaysCompleteAnimation,
          ),
        ),
      ),
    );
  }
}
