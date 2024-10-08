class MedicalEducateModel {
  final String image;
  final String headLine;
  final String shortDescription;
  final List<Topics> longDescription;

  MedicalEducateModel({
    required this.image,
    required this.headLine,
    required this.shortDescription,
    required this.longDescription,
  });
}

///////// the topics inside the long description /////

class Topics {
  final String header;
  final SubTopics description;

  Topics({
    required this.header,
    required this.description,
  });
}

/////////////// sub topic to dors
class SubTopics {
  final String mianTopic;
  final List<String> subTopic;

  SubTopics({
    required this.mianTopic,
    this.subTopic = const [],
  });
}

MedicalEducateModel medicalEducate1 = MedicalEducateModel(
  image: "assets/medical_educate/heart_disease.png",
  headLine: "حول امراض القلب",
  shortDescription:
      "ما هو مرض القب اليكم مرض القلب اعراضه وعوامل الخطر والعلاج",
  longDescription: [
    Topics(
      header: "ما هو مرض القلب",
      description: SubTopics(
        mianTopic:
            'يشير مصطلح "مرض القلب" إلى عدة أنواع من أمراض القلب. وأكثر أنواع أمراض القلب شيوعًا في الولايات المتحدة هو مرض الشريان التاجي . يؤثر مرض الشريان التاجي على تدفق الدم إلى القلب. وقد يؤدي انخفاض تدفق الدم إلى الإصابة بنوبة قلبية',
      ),
    ),
    Topics(
        header: "اعراضه",
        description: SubTopics(
          mianTopic:
              'في بعض الأحيان قد يكون مرض القلب "صامتًا" ولا يتم تشخيصه حتى يعاني الشخص من علامات أو أعراض نوبة قلبية أو قصور في القلب أو عدم انتظام ضربات القلب. عندما تحدث هذه الأحداث، قد تشمل الأعراض ما يلي: 1',
          subTopic: [
            " النوبة القلبية : ألم أو انزعاج في الصدر، ألم في أعلى الظهر أو الرقبة، حرقة المعدة، غثيان أو قيء، تعب شديد، دوار، وضيق في التنفس."
                "قصور القلب : ضيق في التنفس، أو تعب، أو تورم القدمين، أو الكاحلين، أو الساقين، أو البطن، أو أوردة ",
            " عدم انتظام ضربات القلب:شعور بالخفقان في الصدر (خفقان).",
          ],
        )),
  ],
);

MedicalEducateModel medicalEducate2 = MedicalEducateModel(
  image: "assets/medical_educate/heart_attack_secure.png",
  headLine: "الوقاية من الامراض القلبية ؟",
  shortDescription: "تغييرات في نمط الحياة للوقاية من النوبات القلبية",
  longDescription: [
    Topics(
        header: "حلول للنوبات القلبية",
        description: SubTopics(
          mianTopic:
              "إن أسلوب حياتك هو أفضل وسيلة دفاع ضد أمراض القلب والسكتة الدماغية. باتباع هذه الخطوات البسيطة",
        )),
    Topics(
      header: "توقف عن التدخين",
      description: SubTopics(
        mianTopic:
            "إذا كنت تدخن، فأقلع عن التدخين. وإذا كان أحد أفراد أسرتك يدخن، فشجعه على الإقلاع عن التدخين. نحن نعلم أن الأمر صعب. ولكن التعافي من نوبة قلبية أو سكتة دماغية أو العيش مع مرض القلب المزمن أصعب. التزم بالإقلاع عن التدخين. نحن هنا لمساعدتك إذا كنت في حاجة إلى ذلك.",
      ),
    ),
    Topics(
        header: "اختر التغذية الجيدة",
        description: SubTopics(
          mianTopic:
              "إن اتباع نظام غذائي صحي هو أحد أفضل الأسلحة التي يمكنك استخدامها لمحاربة أمراض القلب. فالطعام الذي تتناوله (وكميته) يمكن أن يؤثر على عوامل الخطر الأخرى التي يمكن التحكم فيها: الكولسترول، وضغط الدم، ومستويات الجلوكوز والوزن. اختر الأطعمة الغنية بالعناصر الغذائية - والتي تحتوي على الفيتامينات والمعادن والألياف وغيرها من العناصر الغذائية ولكنها أقل في السعرات الحرارية - بدلاً من الأطعمة الفقيرة بالعناصر الغذائية. اختر نظامًا غذائيًا صحيًا غنيًا بالخضروات والفواكه والحبوب الكاملة. واشتمل على منتجات الألبان قليلة الدسم، والدواجن منزوعة الجلد، والأسماك، والبقوليات، والزيوت النباتية غير الاستوائية والمكسرات. وحد من تناولك للدهون المشبعة والدهون المتحولة، واللحوم الحمراء والمصنعة، والسكريات المضافة، والمشروبات المحلاة بالسكر والصوديوم. وللحفاظ على وزن صحي، نسق نظامك الغذائي مع مستوى نشاطك البدني حتى تتمكن من استهلاك أكبر عدد ممكن من السعرات الحرارية التي تتناولها.",
        ))
  ],
);
MedicalEducateModel medicalEducate3 = MedicalEducateModel(
  image: "assets/medical_educate/heart_Attack.png",
  headLine: "حول امراض القلب",
  shortDescription:
      "ما هو مرض القب اليكم مرض القلب اعراضه وعوامل الخطر والعلاج",
  longDescription: [
    Topics(
        header: "الوقاية من أمراض القلب",
        description: SubTopics(
            mianTopic:
                "يمكنك فعل الكثير لمنع أو تأخير الإصابة بأمراض القلب. يمكنك البدء بتغيير ما تأكله وممارسة المزيد من النشاط البدني. كما أن تجنب منتجات التبغ والحد من تناول الكحوليات يساعد أيضًا. إن إجراء تغييرات صغيرة على حياتك اليومية يمكن أن يؤدي إلى تحسين صحة قلبك. تحدث مع مقدم الرعاية الصحية الخاص بك حول خطة تناسبك.")),
    Topics(
      header: "كيف يمكن الوقاية من أمراض القلب؟",
      description: SubTopics(
          mianTopic:
              """هناك العديد من الأشياء التي يمكنك القيام بها للوقاية من أمراض القلب. بعضها يتضمن تغييرات يمكنك إجراؤها في حياتك اليومية. وفي بعض الحالات، قد تحتاج إلى تناول الأدوية أيضًا.
 تقدم القائمة أدناه تغييرات في نمط الحياة يمكن أن تساعدك على الوقاية من أمراض القلب أو تأخير ظهوره"""),
    )
  ],
);
List<MedicalEducateModel> medicalEducateList = [
  medicalEducate1,
  medicalEducate2,
  medicalEducate3
];
