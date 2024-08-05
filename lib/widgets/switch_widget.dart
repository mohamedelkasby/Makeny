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
      return TestNumber1(yesOrNoQuestions: yesOrNoQuestions);
    case 2:
      return testNumber2(context, yesOrNoQuestions: yesOrNoQuestions);
    case 3:
      return testNumber3(context, yesOrNoQuestions: yesOrNoQuestions);
    case 4:
      return testNumber4(context);
    case 5:
      return testNumber5(context);
    case 6:
      return TestNumber6();
    case 7:
      return TestNumber1(yesOrNoQuestions: yesOrNoQuestions);
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
        height: 250,
      );
    case 2:
      return Image.asset(
        'assets/gif/check.gif',
        height: 300,
      );
    case 3:
      return Image.asset(
        'assets/gif/lung.gif',
        height: 300,
      );
    case 4:
      return Image.asset(
        'assets/gif/heart.gif',
        height: 300,
      );
    case 5:
      return Image.asset(
        'assets/gif/lung.gif',
        height: 300,
      );
    case 6:
      return Image.asset(
        'assets/gif/heart_attack.gif',
        height: 300,
      );
    case 7:
      return Image.asset(
        'assets/gif/mediacl_file.gif',
        height: 300,
      );
    default:
      return Image.asset(
        "assets/gif/dna.gif",
        height: 300,
      );
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
      return [
        "الذكاء الاصطناعي",
        "يقوم بتحليل بياناتك الان",
      ];
  }
}
