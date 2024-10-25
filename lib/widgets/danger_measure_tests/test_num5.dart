import 'package:flutter/material.dart';
import 'package:makeny/widgets/green_note.dart';
import 'package:makeny/widgets/questions_type/grid_one_answer_check.dart';

class TestNumber5 extends StatefulWidget {
  const TestNumber5({
    super.key,
    this.yesOrNoQuestions,
  });
  final List<String>? yesOrNoQuestions;

  @override
  State<TestNumber5> createState() => _TestNumber5State();
}

class _TestNumber5State extends State<TestNumber5> {
  List<int?> selectedAnswers =
      List.filled(12, null); // Assuming there are 12 questions

  void onAnswerSelected(int questionIndex, int answerIndex) {
    setState(() {
      selectedAnswers[questionIndex] = answerIndex;
      // print(selectedAnswers);
    });
  }

  List<Questions> question = [
    Questions(
      quation: "نشاط الاستحمام ؟",
      answers: [
        "لم اقم بهذا النشاط\n( 0 )",
        "محدود بدرجة كبيرة\n( 4 ~1 )",
        "محدود بشدة\n( 7 ~ 4 )",
        "محدود بشكل متوسط\n( 10 ~ 7 )",
        "محدود بشكل خفيف\n( 18 ~10 )",
      ],
    ),
    Questions(
      quation: "المشي من مسافة 100 / 250 متر",
      answers: [
        "لم اقم بهذا النشاط\n( 0 )",
        "محدود بدرجة كبيرة\n( 50 ~ 10 )",
        "محدود بشدة\n( 100 ~ 50 )",
        "محدود بشكل متوسط\n( 200 ~ 100 )",
        "محدود بشكل خفيف\n( 250 ~200 )",
      ],
    ),
    Questions(
      quation: "الهرولة او الاسراع (مثل الجري وراء حافلة )",
      answers: [
        "لم اقم بهذا النشاط\n( 0 )",
        "محدود بدرجة كبيرة\n( 4 ~1 )",
        "محدود بشدة\n( 7 ~ 4 )",
        "محدود بشكل متوسط\n( 10 ~ 7 )",
        "محدود بشكل خفيف\n( 18 ~10 )",
      ],
    ),
    Questions(
      quation:
          "كم مرة حدث تورم في قدميك او كاحليك  عند الاستيقاذ من النوم خلال الاسبوعين  ؟",
      answers: [
        "كل الاوقات",
        "3 مرات او اكثر في الاسبوع",
        "مرة واحدة او مرتين في الاسبوع",
        "اقل من  مرة في الاسبوع",
        "لم يحدث اطلاقا خلال الاسبوعين",
      ],
    ),
    Questions(
      quation:
          "كم مرة اثر فيها ضيق التنفس علي قدرتك بالقيام بما تود القيام به خلال الاسبوعين  ؟",
      answers: [
        "كل الاوقات",
        "3 مرات او اكثر في الاسبوع",
        "مرة واحدة او مرتين في الاسبوع",
        "اقل من  مرة في الاسبوع",
        "لم يحدث اطلاقا خلال الاسبوعين",
      ],
    ),
    Questions(
      quation:
          "كم مرة اثر فيها الاجهاد الشديد  علي قدرتك بالقيام بما تود القيام به خلال الاسبوعين  ؟",
      answers: [
        "لم اقم بهذا النشاط\n( 0 )",
        "محدود بدرجة كبيرة\n( 4 ~1 )",
        "محدود بشدة\n( 7 ~ 4 )",
        "محدود بشكل متوسط\n( 10 ~ 7 )",
        "محدود بشكل خفيف\n( 18 ~10 )",
      ],
    ),
    Questions(
      quation:
          "كم مرة اضطررت الي النوم جالسا علي كرسي او مسند علي ثلاث وسائد علي الاقل لدعمك بسبب ضيق التنفس   ؟",
      answers: [
        "لم اقم بهذا النشاط\n( 0 )",
        "محدود بدرجة كبيرة\n( 4 ~1 )",
        "محدود بشدة\n( 7 ~ 4 )",
        "محدود بشكل متوسط\n( 10 ~ 7 )",
        "محدود بشكل خفيف\n( 18 ~10 )",
      ],
    ),
    Questions(
      quation: "الي اي مدي قلل قصور عضلة القلب من استمتاعك بالحياة ؟",
      answers: [
        "قلل بدرجة كبيره جدا",
        "قلل بدرجة كبيره",
        "قلل بدرجة متوسطة",
        "قلل بدرجة خفيفة",
        "لم يقلل علي الاطلاق",
      ],
    ),
    Questions(
      quation:
          "اذا كان عليك ان تقضي بقية حياتك وانت تعاني من قصور عضلة القلب كما هو الان كيف سيكون شعورك حيال ذالك ؟",
      answers: [
        "غير راضي تماما",
        "غير راضي تماما في الغالب",
        "راضي الي حد ما",
        "راضي في الغالب",
        "راضي تماما",
      ],
    ),
    Questions(
      quation:
          "كيف يوثر قصور عضلة القلب علي نمط حياتك وقلل نشاطك في الهوايات والانشطة الترفيهية خلال الاسبوعين الماضيين ؟",
      answers: [
        "مقيد بشدة",
        "مقيد بدرجة كبيرة",
        "مقيد بدرجة متوسطة",
        "مقيد بدرجة خفيفة",
        "غير مقيد علي الاطلاق",
        "لم اقم بهذا النشاط",
      ],
    ),
    Questions(
      quation:
          "كيف يوثر قصور عضلة القلب علي نمط حياتك وقلل نشاطك في العمل او الاعمال المنزلية الترفيهية خلال الاسبوعين الماضيين ؟",
      answers: [
        "مقيد بشدة",
        "مقيد بدرجة كبيرة",
        "مقيد بدرجة متوسطة",
        "مقيد بدرجة خفيفة",
        "غير مقيد علي الاطلاق",
        "لم اقم بهذا النشاط",
      ],
    ),
    Questions(
      quation:
          "كيف يوثر قصور عضلة القلب علي نمط حياتك وقلل نشاطك في زيارة الاقارب والاصدقاء خارج المنزل خلال الاسبوعين الماضيين ؟",
      answers: [
        "مقيد بشدة",
        "مقيد بدرجة كبيرة",
        "مقيد بدرجة متوسطة",
        "مقيد بدرجة خفيفة",
        "غير مقيد علي الاطلاق",
        "لم اقم بهذا النشاط",
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ////// the green text Start   ////
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: greenNote(
            text:
                "يؤثر القصور الوظيفي لعضلة القلب علي مختلف الاشخاص بطرقة مختلفة حيث يشعر البعض بضيق التنفس واخرين بالاجهاد الشديد.\nمن فضللك بين مدي نشاطك علي مدار الاسبوعين الاخيرين .",
            headerText: "تنوية",
          ),
        ),
        ////// the green text End   ////
        ...List.generate(
          question.length,
          (index) => GridOneAnswerCheck(
            onAnswerSelected: (answerIndex) =>
                onAnswerSelected(index, answerIndex),
            questionsText: question[index].quation,
            selectedAnswer: selectedAnswers[index],
            answers: question[index].answers,
          ),
        ),
      ],
    );
  }
}

class Questions {
  final String quation;
  final List<String> answers;

  Questions({
    required this.quation,
    required this.answers,
  });
}
