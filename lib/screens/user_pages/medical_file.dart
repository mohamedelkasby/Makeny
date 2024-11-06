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
      appBar: defaultAppbar(context, title: "الملف الطبي"),
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
                child: textHeadLine(text: "البيانات الاساسية"),
              ),
            ),
            usersData(
              textType: " إسم المريض",
              seperator: ":",
              textData: " علي محمد",
            ),
            usersData(
              textType: "العمر",
              seperator: ":",
              textData: "٥٠",
            ),
            usersData(
              textType: "رقم الملف",
              seperator: ":",
              textData: "٤٤٣٩٣٠",
            ),
            usersData(
              textType: "الجنسيه",
              seperator: ":",
              textData: "سعودي",
            ),
            usersData(
                textType: "تاريخ الدخول ",
                seperator: ":",
                textData: "٢١ فبراير ٢٠٢٤"),
            Container(
              width: double.maxFinite,
              color: mainColor50,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: textHeadLine(text: "التشخيص"),
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
                child: textHeadLine(text: "المؤشرات  الجسمانية "),
              ),
            ),
            usersData(
              textType: "المؤشرات الجسمية",
              seperator: ":",
              textData: "",
            ),
            usersData(
              textType: "الطول",
              seperator: ":",
              textData: "",
            ),
            usersData(
              textType: "الطول ",
              seperator: ":",
              textData: "١٦٧ سم",
            ),
            usersData(
              textType: "الوزن",
              seperator: ":",
              textData: "٩٧ كجم",
            ),
            usersData(
              textType: "كتله الجسم",
              seperator: ":",
              textData: " ٣٤ كجم/م٢ ",
            ),
          ],
        ),
      ),
    );
  }
}
