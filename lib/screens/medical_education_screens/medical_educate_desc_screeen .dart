import 'package:flutter/material.dart';
import 'package:makeny/models/medical_educate_model.dart';
import 'package:makeny/screens/danger_measure_screens/danger_measure_screen.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';

import 'package:makeny/widgets/defualt_appbar.dart';

class MedicalEducateDescScreen extends StatelessWidget {
  final MedicalEducateModel dataModel;

  const MedicalEducateDescScreen({
    super.key,
    required this.dataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(context, title: "تثقيف طبي"),
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
                      alignment: Alignment(0, -1 + .3),
                    ),
                  ),
                ),
                ...dataModel.longDescription.map(
                  (element) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: textHeaderLight(text: element.header),
                        ),
                        textDescription(text: element.description.mianTopic),
                        ...element.description.subTopic
                            .map((data) => Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        textDescription(text: "\u2022 "),
                                        Expanded(
                                          child: textDescription(
                                            text: "$data",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ))
                            .toList()
                      ],
                    ),
                  ),
                ),
                /////// size box to make the appear
                ///cuase the button when flotted it cover some texts,
                SizedBox(
                  height: 90,
                )
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: defaultButton(
                text: "أحجز موعد الان",
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DangerMeasureScreen(
                      appbar: "مقياس الخطورة",
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
