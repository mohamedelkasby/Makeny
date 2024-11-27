import 'package:easy_localization/easy_localization.dart';

class MedicalEducateModel {
  final String image;
  final String headLineKey;
  final String shortDescriptionKey;
  final List<Topics> longDescription;

  MedicalEducateModel({
    required this.image,
    required this.headLineKey,
    required this.shortDescriptionKey,
    required this.longDescription,
  });

// Dynamically translate the headline and short description
  String get headLine => tr(headLineKey);
  String get shortDescription => tr(shortDescriptionKey);
}

///////// the topics inside the long description /////

class Topics {
  final String headerKey;
  final SubTopics description;

  Topics({
    required this.headerKey,
    required this.description,
  });

  String get header => tr(headerKey);
}

/////////////// sub topic to dors
class SubTopics {
  final String mainTopicKey;
  final List<String> subTopicKeys;

  SubTopics({
    required this.mainTopicKey,
    this.subTopicKeys = const [],
  });
  String get mainTopic => tr(mainTopicKey);
  List<String> get subTopics => subTopicKeys.map((key) => tr(key)).toList();
}

MedicalEducateModel medicalEducate1 = MedicalEducateModel(
  image: "assets/medical_educate/heart_disease.png",
  headLineKey: "medicalEducate.ME_1.head_line_1",
  shortDescriptionKey: "medicalEducate.ME_1.short_desc_1",
  longDescription: [
    Topics(
      headerKey: "medicalEducate.ME_1.head_1",
      description: SubTopics(
        mainTopicKey: "medicalEducate.ME_1.main_topic_1",
      ),
    ),
    Topics(
      headerKey: "medicalEducate.ME_1.head_2",
      description: SubTopics(
        mainTopicKey: "medicalEducate.ME_1.main_topic_2",
        subTopicKeys: [
          "medicalEducate.ME_1.sub_topics_2.sub_1",
          "medicalEducate.ME_1.sub_topics_2.sub_2",
          "medicalEducate.ME_1.sub_topics_2.sub_3",
          "medicalEducate.ME_1.sub_topics_2.sub_4",
        ],
      ),
    ),
    Topics(
        headerKey: "medicalEducate.ME_1.head_3",
        description: SubTopics(
          mainTopicKey: "medicalEducate.ME_1.head_3.main_topic_3",
        )),
    Topics(
      headerKey: "medicalEducate.ME_1.head_4",
      description: SubTopics(
        mainTopicKey: "medicalEducate.ME_1.main_topic_4",
        subTopicKeys: [
          "medicalEducate.ME_1.sub_topics_4.sub_1",
          "medicalEducate.ME_1.sub_topics_4.sub_2",
          "medicalEducate.ME_1.sub_topics_4.sub_3",
          "medicalEducate.ME_1.sub_topics_4.sub_4",
          "medicalEducate.ME_1.sub_topics_4.sub_5",
        ],
      ),
    ),
    Topics(
      headerKey: "medicalEducate.ME_1.head_5",
      description: SubTopics(
        mainTopicKey: "medicalEducate.ME_1.main_topic_5",
        subTopicKeys: [
          "medicalEducate.ME_1.sub_topics_5.sub_1",
          "medicalEducate.ME_1.sub_topics_5.sub_2",
          "medicalEducate.ME_1.sub_topics_5.sub_3",
          "medicalEducate.ME_1.sub_topics_5.sub_4",
        ],
      ),
    ),
  ],
);

MedicalEducateModel medicalEducate2 = MedicalEducateModel(
  image: "assets/medical_educate/heart_attack_secure.png",
  headLineKey: "medicalEducate.ME_2.head_line_1",
  shortDescriptionKey: "medicalEducate.ME_2.short_desc_1",
  longDescription: [
    Topics(
        headerKey: "medicalEducate.ME_2.head_1",
        description: SubTopics(
          mainTopicKey: "medicalEducate.ME_2.main_topic_1",
        )),
    Topics(
      headerKey: "medicalEducate.ME_2.head_2",
      description: SubTopics(
        mainTopicKey: "medicalEducate.ME_2.main_topic_2",
      ),
    ),
    Topics(
      headerKey: "medicalEducate.ME_2.head_3",
      description: SubTopics(mainTopicKey: "medicalEducate.ME_2.main_topic_3"),
    )
  ],
);
MedicalEducateModel medicalEducate3 = MedicalEducateModel(
  image: "assets/medical_educate/heart_Attack.png",
  headLineKey: "medicalEducate.ME_3.head_line_1",
  shortDescriptionKey: "medicalEducate.ME_3.short_desc_1",
  longDescription: [
    Topics(
        headerKey: "medicalEducate.ME_3.head_1",
        description: SubTopics(
          mainTopicKey: "medicalEducate.ME_3.main_topic_1",
        )),
    Topics(
        headerKey: "medicalEducate.ME_3.head_2",
        description: SubTopics(
          mainTopicKey: "medicalEducate.ME_3.main_topic_2",
        ))
  ],
);
List<MedicalEducateModel> medicalEducateList = [
  medicalEducate1,
  medicalEducate2,
  medicalEducate3
];
