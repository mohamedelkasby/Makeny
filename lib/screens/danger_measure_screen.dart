import 'package:flutter/material.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';

class DangerMeasureScreen extends StatelessWidget {
  const DangerMeasureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backArrow(context),
        centerTitle: true,
        title: textNormal(
          text: "مقياس الخطورة",
        ),
      ),
    );
  }
}
