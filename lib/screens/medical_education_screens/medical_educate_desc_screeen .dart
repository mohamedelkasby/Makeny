import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/models/medical_educate_model.dart';
import 'package:makeny/screens/danger_measure_screens/danger_measure_screen.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';

import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/internet_connectivity_wrapper.dart';

class MedicalEducateDescScreen extends StatelessWidget {
  final MedicalEducateModel dataModel;

  const MedicalEducateDescScreen({
    super.key,
    required this.dataModel,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:
            defaultAppbar(context, title: tr("accountPage.medical_education")),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Stack(
            children: [
              ListView(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 180,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        dataModel.image,
                        fit: BoxFit.cover,
                        alignment: const Alignment(0, -1 + .3),
                      ),
                    ),
                  ),
                  ...dataModel.longDescription.map(
                    (element) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          element.header == ""
                              ? const SizedBox()
                              : Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: textHeaderLight(text: element.header),
                                ),
                          textDescription(text: element.description.mainTopic),
                          ...element.description.subTopics.map(
                            (data) => Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textDescription(text: "\u2022 "),
                                    Expanded(
                                      child: textDescription(
                                        text: data,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  /////// size box to make the appear
                  ///cuase the button when flotted it cover some texts,
                  textNormal(
                    text: tr("help_message"),
                    textColor: mainColor,
                  ),
                  SizedBox(
                    height: 90,
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: defaultButton(
                  text: tr("book_a_date_now"),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InternetConnectivityWrapper(
                        child: DangerMeasureScreen(
                          appbar: tr("Severity_scale"),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
