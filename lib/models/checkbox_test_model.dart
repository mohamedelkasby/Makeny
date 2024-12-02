import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:makeny/screens/consultation_screens/consultation_tests/active_test_screen.dart';
import 'package:makeny/screens/consultation_screens/consultation_tests/functional_performance_lower_limbs_test.dart';
import 'package:makeny/screens/consultation_screens/consultation_tests/functional_performance_upper_limbs_test.dart';
import 'package:makeny/screens/quality_of_life_measure_screen.dart';

class CheckboxTestModel {
  final String testName;
  final Widget testPage;
  bool isChecked;

  CheckboxTestModel({
    required this.testPage,
    required this.testName,
    this.isChecked = false,
  });
}

CheckboxTestModel activeTestScreen = CheckboxTestModel(
  testPage: const ActiveTestScreen(),
  testName: tr("consultation_tests.physical_activity"),
);
CheckboxTestModel test2 = CheckboxTestModel(
  testPage: const QualityOfLifeMeasureScreen(
    checkBoxMission: true,
  ),
  testName: tr("consultation_tests.quality_of_life"),
);
CheckboxTestModel test3 = CheckboxTestModel(
  testPage: const FunctionalPerformanceUpperLimbsTest(),
  testName: tr("consultation_tests.functional_performance_upper_limbs"),
);
CheckboxTestModel test4 = CheckboxTestModel(
  testPage: const ActiveTestScreen(),
  testName: tr("consultation_tests.physical_health"),
);
CheckboxTestModel test5 = CheckboxTestModel(
  testPage: const FunctionalPerformanceLowerLimbsTest(),
  testName: tr("consultation_tests.functional_performance_lower_extremities"),
);
List<CheckboxTestModel> tests = [
  activeTestScreen,
  test2,
  test3,
  test4,
  test5,
];
