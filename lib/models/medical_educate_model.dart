import 'package:flutter/material.dart';

class MedicalEducateModel {
  final String image;
  final String headLine;
  final String shortDescription;
  final Text longDescription;

  MedicalEducateModel({
    required this.image,
    required this.headLine,
    required this.shortDescription,
    required this.longDescription,
  });
}

MedicalEducateModel medicalEducate1 = MedicalEducateModel(
  image: "assets/medical_educate/heart_disease.png",
  headLine: "حول امراض القلب",
  shortDescription:
      "ما هو مرض القب اليكم مرض القلب اعراضه وعوامل الخطر والعلاج",
  longDescription: const Text.rich(
    TextSpan(
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
      ),
      children: [
        TextSpan(
          text: "ما هو مرض القلب",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextSpan(text: "\n"),
        TextSpan(
            text:
                ' يشير مصطلح "مرض القلب" إلى عدة أنواع من أمراض القلب. وأكثر أنواع أمراض القلب شيوعًا في الولايات المتحدة هو مرض الشريان التاجي . يؤثر مرض الشريان التاجي على تدفق الدم إلى القلب. وقد يؤدي انخفاض تدفق الدم إلى الإصابة بنوبة قلبية'),
        TextSpan(text: "\n"),
        TextSpan(
          text: "اعراضه",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextSpan(text: "\n"),
        TextSpan(
            text:
                """في بعض الأحيان قد يكون مرض القلب "صامتًا" ولا يتم تشخيصه حتى يعاني الشخص من علامات أو أعراض نوبة قلبية أو قصور في القلب أو عدم انتظام ضربات القلب. عندما تحدث هذه الأحداث، قد تشمل الأعراض ما يلي: 1
النوبة القلبية : ألم أو انزعاج في الصدر، ألم في أعلى الظهر أو الرقبة، حرقة المعدة، غثيان أو قيء، تعب شديد، دوار، وضيق في التنفس.
عدم انتظام ضربات القلب:شعور بالخفقان في الصدر (خفقان).
قصور القلب : ضيق في التنفس، أو تعب، أو تورم القدمين، أو الكاحلين، أو الساقين، أو البطن، أو أوردة """),
        TextSpan(text: "\n"),
      ],
    ),
  ),
);
MedicalEducateModel medicalEducate2 = MedicalEducateModel(
  image: "assets/medical_educate/heart_attack_secure.png",
  headLine: "الوقاية من الامراض القلبية ؟",
  shortDescription: "تغييرات في نمط الحياة للوقاية من النوبات القلبية",
  longDescription: const Text.rich(
    TextSpan(
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
      ),
      children: [
        TextSpan(
          text: "حلول للنوبات القلبية",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextSpan(text: "\n"),
        TextSpan(
            text:
                "إن أسلوب حياتك هو أفضل وسيلة دفاع ضد أمراض القلب والسكتة الدماغية. باتباع هذه الخطوات البسيطة"),
        TextSpan(text: "\n"),
        TextSpan(
          text: "توقف عن التدخين",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextSpan(text: "\n"),
        TextSpan(
            text:
                "إذا كنت تدخن، فأقلع عن التدخين. وإذا كان أحد أفراد أسرتك يدخن، فشجعه على الإقلاع عن التدخين. نحن نعلم أن الأمر صعب. ولكن التعافي من نوبة قلبية أو سكتة دماغية أو العيش مع مرض القلب المزمن أصعب. التزم بالإقلاع عن التدخين. نحن هنا لمساعدتك إذا كنت في حاجة إلى ذلك."),
        TextSpan(text: "\n"),
        TextSpan(
          text: "اختر التغذية الجيدة",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextSpan(text: "\n"),
        TextSpan(
            text:
                "إن اتباع نظام غذائي صحي هو أحد أفضل الأسلحة التي يمكنك استخدامها لمحاربة أمراض القلب. فالطعام الذي تتناوله (وكميته) يمكن أن يؤثر على عوامل الخطر الأخرى التي يمكن التحكم فيها: الكولسترول، وضغط الدم، ومستويات الجلوكوز والوزن. اختر الأطعمة الغنية بالعناصر الغذائية - والتي تحتوي على الفيتامينات والمعادن والألياف وغيرها من العناصر الغذائية ولكنها أقل في السعرات الحرارية - بدلاً من الأطعمة الفقيرة بالعناصر الغذائية. اختر نظامًا غذائيًا صحيًا غنيًا بالخضروات والفواكه والحبوب الكاملة. واشتمل على منتجات الألبان قليلة الدسم، والدواجن منزوعة الجلد، والأسماك، والبقوليات، والزيوت النباتية غير الاستوائية والمكسرات. وحد من تناولك للدهون المشبعة والدهون المتحولة، واللحوم الحمراء والمصنعة، والسكريات المضافة، والمشروبات المحلاة بالسكر والصوديوم. وللحفاظ على وزن صحي، نسق نظامك الغذائي مع مستوى نشاطك البدني حتى تتمكن من استهلاك أكبر عدد ممكن من السعرات الحرارية التي تتناولها."),
        TextSpan(text: "\n"),
      ],
    ),
  ),
);
MedicalEducateModel medicalEducate3 = MedicalEducateModel(
  image: "assets/medical_educate/heart_Attack.png",
  headLine: "حول امراض القلب",
  shortDescription:
      "ما هو مرض القب اليكم مرض القلب اعراضه وعوامل الخطر والعلاج",
  longDescription: const Text.rich(
    TextSpan(
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        height: 10,
      ),
      children: [
        TextSpan(
          text: "الوقاية من أمراض القلب",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextSpan(text: "\n"),
        TextSpan(
            text:
                "يمكنك فعل الكثير لمنع أو تأخير الإصابة بأمراض القلب. يمكنك البدء بتغيير ما تأكله وممارسة المزيد من النشاط البدني. كما أن تجنب منتجات التبغ والحد من تناول الكحوليات يساعد أيضًا. إن إجراء تغييرات صغيرة على حياتك اليومية يمكن أن يؤدي إلى تحسين صحة قلبك. تحدث مع مقدم الرعاية الصحية الخاص بك حول خطة تناسبك."),
        TextSpan(text: "\n"),
        TextSpan(
          text: "كيف يمكن الوقاية من أمراض القلب؟",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextSpan(text: "\n"),
        TextSpan(
            text:
                """هناك العديد من الأشياء التي يمكنك القيام بها للوقاية من أمراض القلب. بعضها يتضمن تغييرات يمكنك إجراؤها في حياتك اليومية. وفي بعض الحالات، قد تحتاج إلى تناول الأدوية أيضًا.
تقدم القائمة أدناه تغييرات في نمط الحياة يمكن أن تساعدك على الوقاية من أمراض القلب أو تأخير ظهوره"""),
        TextSpan(text: "\n"),
      ],
    ),
  ),
);
List<MedicalEducateModel> medicalEducateList = [
  medicalEducate1,
  medicalEducate2,
  medicalEducate3
];
