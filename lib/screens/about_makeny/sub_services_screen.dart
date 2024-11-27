import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makeny/models/medical_educate_model.dart';
import 'package:makeny/models/services_model.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/center_img.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/defualt_appbar.dart';

class SubServicesScreen extends StatelessWidget {
  const SubServicesScreen({super.key, required this.dataModel});
  final ServiceModel dataModel;
  @override
  Widget build(BuildContext context) {
    SubTopics bodyData = SubTopics(
      mainTopicKey: dataModel.header,
      subTopicKeys: dataModel.dataList,
    );
    return SafeArea(
      child: Scaffold(
        appBar: defaultAppbar(context, title: tr("accountPage.our_services")),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    centerImge(
                      img: dataModel.img,
                    ),
                    textHeadLine(text: bodyData.mainTopic),
                    ...bodyData.subTopicKeys.map(
                      (x) => Text(
                        x,
                        style: TextStyle(height: 2),
                      ),
                    ),
                  ],
                ),
              ),
              defaultButton(
                text: "احجز طبيبك الان ",
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
