import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makeny/models/medical_educate_model.dart';
import 'package:makeny/widgets/center_img.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/defualt_appbar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SubTopics aboutMakeny = SubTopics(
      mainTopicKey: tr("accountPage.about_makeny"),
      subTopicKeys: [
        tr("aboutMakeny.data_1"),
        tr("aboutMakeny.data_2"),
        tr("aboutMakeny.data_3"),
      ],
    );
    return SafeArea(
      child: Scaffold(
        appBar: defaultAppbar(context, title: tr("accountPage.about_makeny")),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                centerImge(img: "assets/logo/main_logo.png"),
                Text(
                  tr("accountPage.about_makeny"),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 1.8,
                  ),
                ),
                ...aboutMakeny.subTopicKeys.map(
                  (data) => textDescription(
                    text: data,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
