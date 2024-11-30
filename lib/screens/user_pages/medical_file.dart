import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/widgets/center_img.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/users_data.dart';

class MedicalFile extends StatelessWidget {
  const MedicalFile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(context, title: tr("accountPage.my_medical_file")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            centerImge(img: "assets/gif/mediacl_file.gif"),
            Container(
              width: double.maxFinite,
              color: mainColor50,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: textHeadLine(text: tr("medicalFile.basic_data")),
              ),
            ),
            usersData(
              textType: tr("medicalFile.patient_name"),
              seperator: ":",
              textData: " علي محمد",
            ),
            usersData(
              textType: tr("accountPage.age"),
              seperator: ":",
              textData: "٥٠",
            ),
            usersData(
              textType: tr("medicalFile.file_number"),
              seperator: ":",
              textData: "٤٤٣٩٣٠",
            ),
            usersData(
              textType: tr("medicalFile.nationality"),
              seperator: ":",
              textData: "سعودي",
            ),
            usersData(
                textType: tr("medicalFile.entry_date"),
                seperator: ":",
                textData: "٢١ فبراير ٢٠٢٤"),
            Container(
              width: double.maxFinite,
              color: mainColor50,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: textHeadLine(text: tr("medicalFile.diagnosis")),
              ),
            ),
            Text(
              " إنتان صديدي بالصمام الإصطناعي الأبهري مع تمدد بالشريان الأبهر الصاعد",
              style: TextStyle(fontSize: 16),
            ),
            Container(
              width: double.maxFinite,
              color: mainColor50,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child:
                    textHeadLine(text: tr("medicalFile.physical_indicators")),
              ),
            ),
            usersData(
              textType: tr("medicalFile.physical_indicators"),
              seperator: ":",
              textData: "",
            ),
            usersData(
              textType: tr("accountPage.tall"),
              seperator: ":",
              textData: "167 ${tr("calculates.cm")}",
            ),
            usersData(
              textType: tr("accountPage.wight"),
              seperator: ":",
              textData: "97 ${tr("calculates.kg")}",
            ),
            usersData(
              textType: tr("medicalFile.body_mass"),
              seperator: ":",
              textData: "34 ${tr("calculates.kg/m2")}",
            ),
          ],
        ),
      ),
    );
  }
}
