import 'package:flutter/widgets.dart';
import 'package:makeny/screens/consulation_screens/active_test_screen.dart';
import 'package:makeny/screens/consulation_screens/functional_performance_lower_limbs_test.dart';
import 'package:makeny/screens/consulation_screens/functional_performance_upper_limbs_test.dart';
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
  testName: "اختبار النشاط البدني",
);
CheckboxTestModel test2 = CheckboxTestModel(
  testPage: const QualityOfLifeMeasureScreen(
    checkBoxMission: true,
  ),
  testName: "اختبار جودة الحياة  ",
);
CheckboxTestModel test3 = CheckboxTestModel(
  testPage: const FunctionalPerformanceUpperLimbsTest(),
  testName: "الاداء الوظيفي لاطراف العلوية",
);
CheckboxTestModel test4 = CheckboxTestModel(
  testPage: ActiveTestScreen(),
  testName: "اختبار  الصحه البدنية  ",
);
CheckboxTestModel test5 = CheckboxTestModel(
  testPage: FunctionalPerformanceLowerLimbsTest(),
  testName: "الاداء الوظيفي للاطراف السفلية ",
);
List<CheckboxTestModel> tests = [
  activeTestScreen,
  test2,
  test3,
  test4,
  test5,
];
