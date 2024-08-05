import 'package:flutter/material.dart';
import 'package:makeny/widgets/defualt_appbar.dart';

class FinishTest extends StatelessWidget {
  const FinishTest({
    super.key,
    required this.appbar,
  });
  final appbar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(context, title: appbar),
      body: SizedBox(),
    );
  }
}
