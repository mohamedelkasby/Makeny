import 'package:flutter/material.dart';
import 'package:makeny/widgets/danger_measure_tests/body_test_num6/first_page.dart';
import 'package:makeny/widgets/danger_measure_tests/body_test_num6/second_page.dart';
import 'package:makeny/widgets/danger_measure_tests/body_test_num6/third_page.dart';

Widget switchBodyNum6(expression) {
  switch (expression) {
    case 0:
      return firstPage();
    case 1:
      return SecondPage();
    case 2:
      return thirdPage();
    default:
      return SizedBox();
  }
}
