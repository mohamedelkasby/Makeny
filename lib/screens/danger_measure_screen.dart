import 'package:flutter/material.dart';
import 'package:makeny/widgets/defualt_appbar.dart';

class DangerMeasureScreen extends StatelessWidget {
  const DangerMeasureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(
        context,
        title: "مقياس الخطورة",
      ),
    );
  }
}
