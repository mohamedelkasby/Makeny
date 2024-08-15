import 'package:flutter/material.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/danger_measure_tests/test_num1.dart';
import 'package:makeny/widgets/danger_measure_tests/test_num2.dart';
import 'package:makeny/widgets/danger_measure_tests/test_num3.dart';
import 'package:makeny/widgets/danger_measure_tests/test_num4.dart';
import 'package:makeny/widgets/danger_measure_tests/test_num5.dart';
import 'package:makeny/widgets/danger_measure_tests/test_num6.dart';
import 'package:makeny/widgets/green_note.dart';
import 'package:makeny/widgets/questions_type/long_one_answer_check.dart';
import 'package:makeny/widgets/slider_widget.dart';

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
      return TestNumber2(yesOrNoQuestions: yesOrNoQuestions);
    case 3:
      return TestNumber3(yesOrNoQuestions: yesOrNoQuestions);
    case 4:
      return testNumber4(context);
    case 5:
      return testNumber5(context);
    case 6:
      return const TestNumber6();
    case 7:
      return TestNumber1(yesOrNoQuestions: yesOrNoQuestions);
    default:
      return const SizedBox();
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

Widget switchQualityOfLifePage(testNumber) {
  switch (testNumber) {
    case 1:
      return Column(
        children: [
          greenNote(
              text: "يرجي تحديد اختيار واحد يصف افضل صورة لحالتك الصحية اليوم"),
          LongOneAnswerCheck(
            questionText: "القدرة علي الحركة",
            answers: [
              "ليس   لدي أي مشاكل أثناء المشي",
              "أعاني من مشاكل طفيفة عند المشي",
              "أعاني   من مشاكل متوسطة عند المشي",
              "أعاني من مشاكل حادة عند المشي",
              "ليس   لدي القدرة على المشي",
            ],
            onAnswerSelected: (_) {},
          ),
        ],
      );
    case 2:
      return LongOneAnswerCheck(
        questionText: "القدرة علي العناية الشخصية ",
        answers: [
          "ليس   لدي أي مشاكل عند الاستحمام أو ارتداء ملابسي بنفسي",
          "أعاني من مشاكل طفيفة عند الاستحمام أو ارتداء الملابس   بنفسي",
          "أعاني   من مشاكل متوسطة عند الاستحمام أو ارتداء الملابس بنفسي",
          "أعاني من مشاكل حادة عند الاستحمام أو ارتداء الملابس   بنفسي",
          "ليس   لدي القدرة على الاستحمام أو ارتداء الملابس بنفسي",
        ],
        onAnswerSelected: (_) {},
      );
    case 3:
      return LongOneAnswerCheck(
        questionText:
            "الأنشطة المعتادة (مثل العمل، الدراسة، الأعمال المنزلية، الأنشطة الأسرية أو الترفيهية ",
        answers: [
          "ليس   لدي أي مشاكل في ممارسة نشاطاتي المعتادة",
          "أعاني من مشاكل طفيفة عند الاستحمام أو ارتداء الملابس   بنفسي",
          "أعاني   من مشاكل متوسطة عند الاستحمام أو ارتداء الملابس بنفسي",
          "أعاني من مشاكل حادة عند الاستحمام أو ارتداء الملابس   بنفسي",
          "ليس   لدي القدرة على الاستحمام أو ارتداء الملابس بنفسي",
        ],
        onAnswerSelected: (_) {},
      );
    case 4:
      return LongOneAnswerCheck(
        questionText: "الألم /   الإحساس بعدم الراحة",
        answers: [
          "لا   أشعر بأي ألم أو بعدم الراحة",
          "أشعر بدرجة طفيفة من الألم أو   عدم الراحة",
          "أشعر   بدرجة متوسطة من الألم أو عدم الراحة",
          "أشعر بدرجة شديدة من الألم أو   عدم الراحة",
          "أشعر   بدرجة شديدة جداً من الألم أو عدم الراحة",
        ],
        onAnswerSelected: (_) {},
      );
    case 5:
      return LongOneAnswerCheck(
        questionText: "القلق / الاكتئاب",
        answers: [
          "لا   أعاني أي قلق أو إكتئاب",
          "أعاني درجة طفيفة من القلق أو الإكتئاب",
          "أعاني   درجة متوسطة من القلق أو الإكتئاب",
          "أعاني   درجة شديدة من القلق أو الإكتئاب",
          "أفضل     حالة صحية يمكن تخيلها",
        ],
        onAnswerSelected: (_) {},
      );
    case 6:
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 10,
            ),
            child: defalutQuestionText(text: "جودة حياتك"),
          ),
          greenNote(
            text:
                "نود أن نعرف مدى سلامة حياتك الصحية,  هذا المقياس مدرج من   الرقم 0 حتى 100·   بحيث يشير الرقم 100 إلى أفضل   حالة صحية يمكن تخيلها والرقم صفر إلى اسوء حالة ",
          ),
          SizedBox(
            height: 120,
          ),
          SliderWidget(),
        ],
      );
    default:
      return SizedBox();
  }
}
