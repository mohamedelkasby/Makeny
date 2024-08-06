import 'package:flutter/widgets.dart';
import 'package:makeny/screens/active_test_screen.dart';

class TestCheckboxeModle {
  final String nameTest;
  bool checkedOrNot;
  final Widget namePage;

  TestCheckboxeModle({
    required this.namePage,
    required this.checkedOrNot,
    required this.nameTest,
  });
}

TestCheckboxeModle test1 = TestCheckboxeModle(
  checkedOrNot: true,
  namePage: ActiveTestScreen(),
  nameTest: "اختبار النشاط البدني",
);
TestCheckboxeModle test2 = TestCheckboxeModle(
  checkedOrNot: false,
  namePage: ActiveTestScreen(),
  nameTest: "اختبار جودة الحياة  ",
);
TestCheckboxeModle test3 = TestCheckboxeModle(
  checkedOrNot: false,
  namePage: ActiveTestScreen(),
  nameTest: "الاداء الوظيفي لاطراف العلوية",
);
TestCheckboxeModle test4 = TestCheckboxeModle(
  checkedOrNot: false,
  namePage: ActiveTestScreen(),
  nameTest: "اختبار  الصحه البدنية  ",
);
TestCheckboxeModle test5 = TestCheckboxeModle(
  checkedOrNot: false,
  namePage: ActiveTestScreen(),
  nameTest: "الاداء الوظيفي لاطراف العلوية",
);
TestCheckboxeModle test6 = TestCheckboxeModle(
  checkedOrNot: false,
  namePage: ActiveTestScreen(),
  nameTest: "الاداء الوظيفي للاطراف السفلية ",
);
List<TestCheckboxeModle> test = [
  test1,
  test2,
  test3,
  test4,
  test5,
  test6,
];
