import 'package:flutter/material.dart';
import 'package:makeny/widgets/danger_measure_tests/body_test_num6/second_page.dart';
import 'package:makeny/widgets/danger_measure_tests/body_test_num6/third_page.dart';

Widget switchBodyNum6(
  expression, {
  required String? selectedAnswer,
  Function(bool)? onTestCompletion,
  Function(Map<String, dynamic>)? onDataCollected,
}) {
  switch (expression) {
    case 1:
      return SecondPage(
        selectedText: selectedAnswer,
        onTestCompletion: onTestCompletion,
        onDataCollected: onDataCollected,
      );
    case 2:
      return thirdPage(
        onTestCompletion: onTestCompletion,
        onDataCollected: onDataCollected,
      );
    default:
      return SizedBox();
  }
}
