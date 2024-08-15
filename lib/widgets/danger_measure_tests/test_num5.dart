import 'package:flutter/material.dart';
import 'package:makeny/widgets/green_note.dart';
import 'package:makeny/widgets/questions_type/grid_one_answer_check.dart';

Widget testNumber5(
  context, {
  final yesOrNoQuestions = const [],
}) {
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
      GridOneAnswerCheck(
        onAnswerSelected: (_) {},
        questionsText: "نشاط الاستحمام ؟",
        answers: const [
          "لم اقم بهذا النشاط\n( 0 )",
          "محدود بدرجة كبيرة\n( 4 ~1 )",
          "محدود بشدة\n( 7 ~ 4 )",
          "محدود بشكل متوسط\n( 10 ~ 7 )",
          "محدود بشكل خفيف\n( 18 ~10 )",
        ],
      ),
      GridOneAnswerCheck(
        onAnswerSelected: (_) {},
        questionsText: "المشي من مسافة 100 / 250 متر",
        answers: const [
          "لم اقم بهذا النشاط\n( 0 )",
          "محدود بدرجة كبيرة\n( 50 ~ 10 )",
          "محدود بشدة\n( 100 ~ 50 )",
          "محدود بشكل متوسط\n( 200 ~ 100 )",
          "محدود بشكل خفيف\n( 250 ~200 )",
        ],
      ),
      GridOneAnswerCheck(
        onAnswerSelected: (_) {},
        questionsText: "الهرولة او الاسراع (مثل الجري وراء حافلة )",
        answers: const [
          "لم اقم بهذا النشاط\n( 0 )",
          "محدود بدرجة كبيرة\n( 4 ~1 )",
          "محدود بشدة\n( 7 ~ 4 )",
          "محدود بشكل متوسط\n( 10 ~ 7 )",
          "محدود بشكل خفيف\n( 18 ~10 )",
        ],
      ),
      GridOneAnswerCheck(
        onAnswerSelected: (_) {},
        questionsText:
            "كم مرة حدث تورم في قدميك او كاحليك  عند الاستيقاذ من النوم خلال الاسبوعين  ؟",
        answers: const [
          "كل الاوقات",
          "3 مرات او اكثر في الاسبوع",
          "مرة واحدة او مرتين في الاسبوع",
          "اقل من  مرة في الاسبوع",
          "لم يحدث اطلاقا خلال الاسبوعين",
        ],
      ),
      GridOneAnswerCheck(
        onAnswerSelected: (_) {},
        questionsText:
            "كم مرة اثر فيها ضيق التنفس علي قدرتك بالقيام بما تود القيام به خلال الاسبوعين  ؟",
        answers: const [
          "كل الاوقات",
          "3 مرات او اكثر في الاسبوع",
          "مرة واحدة او مرتين في الاسبوع",
          "اقل من  مرة في الاسبوع",
          "لم يحدث اطلاقا خلال الاسبوعين",
        ],
      ),
      GridOneAnswerCheck(
        onAnswerSelected: (_) {},
        questionsText:
            "كم مرة اثر فيها الاجهاد الشديد  علي قدرتك بالقيام بما تود القيام به خلال الاسبوعين  ؟",
        answers: const [
          "لم اقم بهذا النشاط\n( 0 )",
          "محدود بدرجة كبيرة\n( 4 ~1 )",
          "محدود بشدة\n( 7 ~ 4 )",
          "محدود بشكل متوسط\n( 10 ~ 7 )",
          "محدود بشكل خفيف\n( 18 ~10 )",
        ],
      ),
      GridOneAnswerCheck(
        onAnswerSelected: (_) {},
        questionsText:
            "كم مرة اضطررت الي النوم جالسا علي كرسي او مسند علي ثلاث وسائد علي الاقل لدعمك بسبب ضيق التنفس   ؟",
        answers: const [
          "لم اقم بهذا النشاط\n( 0 )",
          "محدود بدرجة كبيرة\n( 4 ~1 )",
          "محدود بشدة\n( 7 ~ 4 )",
          "محدود بشكل متوسط\n( 10 ~ 7 )",
          "محدود بشكل خفيف\n( 18 ~10 )",
        ],
      ),
      GridOneAnswerCheck(
        onAnswerSelected: (_) {},
        questionsText: "الي اي مدي قلل قصور عضلة القلب من استمتاعك بالحياة ؟",
        answers: const [
          "قلل بدرجة كبيره جدا",
          "قلل بدرجة كبيره",
          "قلل بدرجة متوسطة",
          "قلل بدرجة خفيفة",
          "لم يقلل علي الاطلاق",
        ],
      ),
      GridOneAnswerCheck(
        onAnswerSelected: (_) {},
        questionsText:
            "اذا كان عليك ان تقضي بقية حياتك وانت تعاني من قصور عضلة القلب كما هو الان كيف سيكون شعورك حيال ذالك ؟",
        answers: const [
          "غير راضي تماما",
          "غير راضي تماما في الغالب",
          "راضي الي حد ما",
          "راضي في الغالب",
          "راضي تماما",
        ],
      ),
      GridOneAnswerCheck(
        onAnswerSelected: (_) {},
        questionsText:
            "كيف يوثر قصور عضلة القلب علي نمط حياتك وقلل نشاطك في الهوايات والانشطة الترفيهية خلال الاسبوعين الماضيين ؟",
        answers: const [
          "مقيد بشدة",
          "مقيد بدرجة كبيرة",
          "مقيد بدرجة متوسطة",
          "مقيد بدرجة خفيفة",
          "غير مقيد علي الاطلاق",
          "لم اقم بهذا النشاط",
        ],
      ),
      GridOneAnswerCheck(
        onAnswerSelected: (_) {},
        questionsText:
            "كيف يوثر قصور عضلة القلب علي نمط حياتك وقلل نشاطك في العمل او الاعمال المنزلية الترفيهية خلال الاسبوعين الماضيين ؟",
        answers: const [
          "مقيد بشدة",
          "مقيد بدرجة كبيرة",
          "مقيد بدرجة متوسطة",
          "مقيد بدرجة خفيفة",
          "غير مقيد علي الاطلاق",
          "لم اقم بهذا النشاط",
        ],
      ),
      GridOneAnswerCheck(
        onAnswerSelected: (_) {},
        questionsText:
            "كيف يوثر قصور عضلة القلب علي نمط حياتك وقلل نشاطك في زيارة الاقارب والاصدقاء خارج المنزل خلال الاسبوعين الماضيين ؟",
        answers: const [
          "مقيد بشدة",
          "مقيد بدرجة كبيرة",
          "مقيد بدرجة متوسطة",
          "مقيد بدرجة خفيفة",
          "غير مقيد علي الاطلاق",
          "لم اقم بهذا النشاط",
        ],
      ),
    ],
  );
}

// Widget _defGreenContainer({
//   required String text,
// }) {
//   return Container(
//     margin: EdgeInsets.symmetric(vertical: 10),
//     height: 70,
//     decoration: BoxDecoration(
//       // color: Colors.green,
//       borderRadius: BorderRadius.circular(5),
//       border: Border.all(
//         color: Color(0xffE8E8E8),
//       ),
//     ),
//     child: Center(
//       child: defText(
//         text: text,
//         color: greyColor,
//       ),
//     ),
//   );
// }
