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
            UsersData(
              textType: " إسم المريض",
              seperator: ":",
              textData: " علي محمد",
            ),
            UsersData(
              textType: "العمر",
              seperator: ":",
              textData: "٥٠",
            ),
            UsersData(
              textType: "رقم الملف",
              seperator: ":",
              textData: "٤٤٣٩٣٠",
            ),
            UsersData(
              textType: "الجنسيه",
              seperator: ":",
              textData: "سعودي",
            ),
            UsersData(
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
            UsersData(
              textType: "المؤشرات الجسمية",
              seperator: ":",
              textData: "",
            ),
            UsersData(
              textType: "الطول",
              seperator: ":",
              textData: "",
            ),
            UsersData(
              textType: "الطول ",
              seperator: ":",
              textData: "١٦٧ سم",
            ),
            UsersData(
              textType: "الوزن",
              seperator: ":",
              textData: "٩٧ كجم",
            ),
            UsersData(
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
