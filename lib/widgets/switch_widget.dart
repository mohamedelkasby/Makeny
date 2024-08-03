import 'package:flutter/material.dart';
import 'package:makeny/widgets/danger_measure_tests/test_num1.dart';
import 'package:makeny/widgets/danger_measure_tests/test_num2.dart';
import 'package:makeny/widgets/danger_measure_tests/test_num3.dart';
import 'package:makeny/widgets/danger_measure_tests/test_num4.dart';
import 'package:makeny/widgets/danger_measure_tests/test_num5.dart';
import 'package:makeny/widgets/danger_measure_tests/test_num6.dart';

Widget switchPagesTest(
  context, {
  required final int testNumber,
  final List<String> yesOrNoQuestions = const [],
}) {
  print("switchPagesTest called with testNumber: $testNumber");

  switch (testNumber) {
    case 1:
      return testNumber1(context, yesOrNoQuestions: yesOrNoQuestions);
    case 2:
      return testNumber2(context, yesOrNoQuestions: yesOrNoQuestions);
    case 3:
      return testNumber3(context, yesOrNoQuestions: yesOrNoQuestions);
    case 4:
      return testNumber4(context, yesOrNoQuestions: yesOrNoQuestions);
    case 5:
      return testNumber5(context, yesOrNoQuestions: yesOrNoQuestions);
    case 6:
      return testNumber6(context, yesOrNoQuestions: yesOrNoQuestions);
    case 7:
      return testNumber1(context, yesOrNoQuestions: yesOrNoQuestions);
    default:
      return SizedBox();
  }
}

String switchAppbar({
  required final int testNumber,
}) {
  switch (testNumber) {
    case 1:
      return "خطورة الاصابة بالرجفان الاذني والجلطة الدماغية";
    case 2:
      return "خطورة الاختناق";
    case 3:
      return "ضيق التنفس";
    case 4:
      return "مقياس اعتلال عضلة القلب";
    case 5:
      return "مقياس ضيق التنفس متعدد الابعاد";
    case 6:
      return "استبانة سياتل للذبحة الصدرية";
    case 7:
      return "حجز موعد";

    default:
      return "";
  }
}

Widget switchNextTest({
  required final int testNumber,
}) {
  switch (testNumber) {
    case 1:
      return Image.asset(
        'assets/gif/cell.gif',
        height: 220,
      );
    case 2:
      return Image.asset(
        'assets/gif/check.gif',
        height: 220,
      );
    case 3:
      return Image.asset(
        'assets/gif/lung.gif',
        height: 220,
      );
    case 4:
      return Image.asset(
        'assets/gif/heart.gif',
        height: 220,
      );
    case 5:
      return Image.asset(
        'assets/gif/lung.gif',
        height: 220,
      );
    case 6:
      return Image.asset(
        'assets/gif/heart_attack.gif',
        height: 220,
      );
    case 7:
      return Image.asset(
        'assets/gif/mediacl_file.gif',
        height: 220,
      );
    default:
      return SizedBox.shrink();
  }
}

List<String> switchNextTestListText({
  required final int testNumber,
}) {
  switch (testNumber) {
    case 1:
      return [
        "احسنت",
        "الانتقال للاختبار التالي",
      ];
    case 2:
      return [
        "احسنت لقد اتممت نصف الاختبار!",
        "جارٍ تحليل اجاباتك وتحضير الاختبار التالي...",
      ];
    case 3:
      return [
        "احسنت",
        "الانتقال للاختبار التالي",
      ];
    case 4:
      return [
        "التالي مقياس اعتلال عضلة القلب",
        "",
      ];
    case 5:
      return [
        "مقياس ضيق التنفس متعدد الابعاد",
        "",
      ];
    case 6:
      return [
        "استبانة سياتل للذبحة الصدرية",
        "اخر اختبار",
      ];
    case 7:
      return [
        "تم تحليل اجابتك وارسالها للطبيب",
        "الرجاء حجز موعد الاستشارة",
      ];
    default:
      return [];
  }
}
