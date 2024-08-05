import 'package:flutter/material.dart';
import 'package:makeny/screens/danger_measure_screen.dart';

Widget testNumber5(
  context, {
  required final yesOrNoQuestions,
}) {
  return Column(
    // shrinkWrap: true,
    children: [
      ////// the green text Start   ////
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xffD0FFBF)),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                defText(
                  text: "تنوية",
                  weight: FontWeight.w900,
                ),
                SizedBox(
                  height: 8,
                ),
                defText(
                  text:
                      "يؤثر القصور الوظيفي لعضلة القلب علي مختلف الاشخاص بطرقة مختلفة حيث يشعر البعض بضيق التنفس واخرين بالاجهاد الشديد.\nمن فضللك بين مدي نشاطك علي مدار الاسبوعين الاخيرين .",
                ),
              ],
            ),
          ),
        ),
      ),
      ////// the green text End   ////
      OneAnswerCheck(
        questionsText: "نشاط الاستحمام ؟",
        answers: [
          "لم اقم بهذا النشاط\n( 0 )",
          "محدود بدرجة كبيرة\n( 4 ~1 )",
          "محدود بشدة\n( 7 ~ 4 )",
          "محدود بشكل متوسط\n( 10 ~ 7 )",
          "محدود بشكل خفيف\n( 18 ~10 )",
        ],
      ),
      OneAnswerCheck(
        questionsText: "المشي من مسافة 100 / 250 متر",
        answers: [
          "لم اقم بهذا النشاط\n( 0 )",
          "محدود بدرجة كبيرة\n( 50 ~ 10 )",
          "محدود بشدة\n( 100 ~ 50 )",
          "محدود بشكل متوسط\n( 200 ~ 100 )",
          "محدود بشكل خفيف\n( 250 ~200 )",
        ],
      ),
      OneAnswerCheck(
        questionsText: "الهرولة او الاسراع (مثل الجري وراء حافلة )",
        answers: [
          "لم اقم بهذا النشاط\n( 0 )",
          "محدود بدرجة كبيرة\n( 4 ~1 )",
          "محدود بشدة\n( 7 ~ 4 )",
          "محدود بشكل متوسط\n( 10 ~ 7 )",
          "محدود بشكل خفيف\n( 18 ~10 )",
        ],
      ),
      OneAnswerCheck(
        questionsText:
            "كم مرة حدث تورم في قدميك او كاحليك  عند الاستيقاذ من النوم خلال الاسبوعين  ؟",
        answers: [
          "كل الاوقات",
          "3 مرات او اكثر في الاسبوع",
          "مرة واحدة او مرتين في الاسبوع",
          "اقل من  مرة في الاسبوع",
          "لم يحدث اطلاقا خلال الاسبوعين",
        ],
      ),
      OneAnswerCheck(
        questionsText:
            "كم مرة اثر فيها ضيق التنفس علي قدرتك بالقيام بما تود القيام به خلال الاسبوعين  ؟",
        answers: [
          "كل الاوقات",
          "3 مرات او اكثر في الاسبوع",
          "مرة واحدة او مرتين في الاسبوع",
          "اقل من  مرة في الاسبوع",
          "لم يحدث اطلاقا خلال الاسبوعين",
        ],
      ),
      OneAnswerCheck(
        questionsText:
            "كم مرة اثر فيها الاجهاد الشديد  علي قدرتك بالقيام بما تود القيام به خلال الاسبوعين  ؟",
        answers: [
          "لم اقم بهذا النشاط\n( 0 )",
          "محدود بدرجة كبيرة\n( 4 ~1 )",
          "محدود بشدة\n( 7 ~ 4 )",
          "محدود بشكل متوسط\n( 10 ~ 7 )",
          "محدود بشكل خفيف\n( 18 ~10 )",
        ],
      ),
      OneAnswerCheck(
        questionsText:
            "كم مرة اضطررت الي النوم جالسا علي كرسي او مسند علي ثلاث وسائد علي الاقل لدعمك بسبب ضيق التنفس   ؟",
        answers: [
          "لم اقم بهذا النشاط\n( 0 )",
          "محدود بدرجة كبيرة\n( 4 ~1 )",
          "محدود بشدة\n( 7 ~ 4 )",
          "محدود بشكل متوسط\n( 10 ~ 7 )",
          "محدود بشكل خفيف\n( 18 ~10 )",
        ],
      ),
      OneAnswerCheck(
        questionsText: "الي اي مدي قلل قصور عضلة القلب من استمتاعك بالحياة ؟",
        answers: [
          "قلل بدرجة كبيره جدا",
          "قلل بدرجة كبيره",
          "قلل بدرجة متوسطة",
          "قلل بدرجة خفيفة",
          "لم يقلل علي الاطلاق",
        ],
      ),
      OneAnswerCheck(
        questionsText:
            "اذا كان عليك ان تقضي بقية حياتك وانت تعاني من قصور عضلة القلب كما هو الان كيف سيكون شعورك حيال ذالك ؟",
        answers: [
          "غير راضي تماما",
          "غير راضي تماما في الغالب",
          "راضي الي حد ما",
          "راضي في الغالب",
          "راضي تماما",
        ],
      ),
      OneAnswerCheck(
        questionsText:
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
      OneAnswerCheck(
        questionsText:
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
      OneAnswerCheck(
        questionsText:
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
