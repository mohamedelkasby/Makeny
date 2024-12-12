import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:makeny/screens/consultation_screens/consultation_tests/active_test_screen.dart';
import 'package:makeny/screens/consultation_screens/consultation_tests/functional_performance_lower_limbs_test.dart';
import 'package:makeny/screens/consultation_screens/consultation_tests/functional_performance_upper_limbs_test.dart';
import 'package:makeny/screens/quality_of_life_measure_screen.dart';

class CheckboxTestModel {
  final String testNameKey;
  final Widget testPage;
  bool isChecked;

  CheckboxTestModel({
    required this.testPage,
    required this.testNameKey,
    this.isChecked = false,
  });
  String get testName => tr(testNameKey);
}

CheckboxTestModel activeTest = CheckboxTestModel(
  testPage: const ActiveTestScreen(),
  testNameKey: "consultation_tests.physical_activity.test_name",
);
CheckboxTestModel qualityOfLifeMeasureTest = CheckboxTestModel(
  testPage: const QualityOfLifeMeasureScreen(
    checkBoxMission: true,
  ),
  testNameKey: "consultation_tests.quality_of_life.test_name",
);
CheckboxTestModel functionalPerformanceUpperLimbsTest = CheckboxTestModel(
  testPage: const FunctionalPerformanceUpperLimbsTest(),
  testNameKey:
      "consultation_tests.functional_performance_upper_limbs.test_name",
);
CheckboxTestModel functionalPerformanceLowerLimbsTest = CheckboxTestModel(
  testPage: const FunctionalPerformanceLowerLimbsTest(),
  testNameKey:
      "consultation_tests.functional_performance_lower_extremities.test_name",
);
List<CheckboxTestModel> tests = [
  activeTest,
  qualityOfLifeMeasureTest,
  functionalPerformanceUpperLimbsTest,
  functionalPerformanceLowerLimbsTest,
];
