class ServiceModle {
  final String img;
  final String header;
  final List<String> dataList;

  ServiceModle({
    required this.img,
    required this.header,
    required this.dataList,
  });
}

ServiceModle service1 = ServiceModle(
  img: "assets/servises_img/serviseMakeny1.png",
  header: "مكني لصحة القلب",
  dataList: ["dataList", "lkjadskjby ljk"],
);
ServiceModle service2 = ServiceModle(
  img: "assets/servises_img/serviseMakeny22.png",
  header: "مكني لصحة قلب المرأة",
  dataList: [
    "النساء المصابات بأمراض القلب يكونون أكثر عرضة الى تدهور جودة حياتهم مقارنة بالرجال نتيجة ضعف التثقيف الصحي بطبيعة المرض وغياب البيئة المناسبة للدعم النفسي و الإجتماعي و العاطفي",
    "يوفر برنامج مكني للنساء المصابات بأمراض القلب في مجتمعنا إمكانية الوصول إلى الدعم الطبي الشمولي آثناء رحلة الشفاء لتعزيز جودة الحياة و الوصول الى مرحلة التعافي الصحي الأمثل."
  ],
);
ServiceModle service3 = ServiceModle(
  img: "assets/servises_img/serviseMakeny33.png",
  header: "مكني لمرضى قصور القلب",
  dataList: [
    "يعاني مرضى قصور القلب من عدم القدرة على ممارسة نشاطاتهم البدنية و تحمل الجهد البدني، ضعف العضلات ،ضيق التنفس ، الخلل المعرفي والإدراكي ، مشاكل وصعوبة في النوم ، التعب و الإرهاق ، كل هذه العوامل تؤثر سلبا جودة حياتهم.",
    "هذه الأعراض تجعل المرضى خاملين بدنيا خوفا من ممارسة النشاط البدني لكي لا تزيد أعراضهم مما يساهم في تفاقم حالتهم المرضية وازدياد سوءا.",
    " نحن في برنامج مكني نقدم خدمات إعادة تأهيل القلب لمرضى قصور القلب ويشمل  ذلك تقييم حالة المريض الصحية، البدنية، النفسية و الإجتماعية. وبناء على التقييم الطبي نقوم بتصميم برنامج علاجي يكون المريض هو محور الخطة العلاجية بما يتناسب مع أهدافه و تطلعاته.",
    " ،  نحرص في هذا البرنامج على تثقيف المريض و زيادة التوعية  بعوامل الخطورة وكيفية التحكم بها. كذلك نهتم نهتم بالجانب النفسي والاجتماعي و توفير الدعم لهما."
  ],
);
ServiceModle service4 = ServiceModle(
  img: "assets/servises_img/serviseMakeny44.png",
  header: "مكني لصحتي في لياقتي",
  dataList: [
    "برنامج صحتي في لياقتي هو برنامج للأشخاص المعرضين لخطر الإصابة بأمراض القلب نتيجة وجود عوامل الخطورة المهددة لصحة القلب مثل التدخين، إرتفاع ضغط الدم، ارتفاع الكلوسترول والدهون الثلاثية الضارة، داء السكري، الخمول البدني.",
    " يساعد هذا البرنامج الأفراد على التحكم في عوامل الخطورة من خلال إنشاء برنامج شخصي مقتنع يحتوي على التمارين العلاجية، النظام الغذائي الصحي والتوعية بأمراض القلب وكيفية تقليل مخاطر الإصابة بها. من خلال هذا البرنامج يتم المتابعة الدورية لمراقبة العلاج الطبي و التطور في اللياقة القلبية التنفسية و تعديل الخطة العلاجية."
  ],
);

List<ServiceModle> services = [service1, service2, service3, service4];
