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
      mianTopic: "عن مكني ",
      subTopic: [
        'برنامج مكني هو برنامج يهتم بصحة القلب ونمط الحياة مخصص للأشخاص الذين يعانون من أمراض القلب و الأوعية الدموية وللأشخاص المعرضين لخطر الإصابة بهذه الأمراض',
      ],
    );
    return Scaffold(
      appBar: defaultAppbar(context, title: "عن مكني"),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            centerImge(img: "assets/logo/main_logo.png"),
            textHeadLine(text: "عن مكني"),
            ...aboutMakeny.subTopic.map(
              (x) => Text(
                " برنامج مكني هو برنامج يهتم بصحة القلب ونمط الحياة مخصص للأشخاص الذين يعانون من أمراض القلب و الأوعية الدموية وللأشخاص المعرضين لخطر الإصابة بهذه الأمراض.",
                style: TextStyle(height: 2),
              ),
            ),
            ...aboutMakeny.subTopic.map(
              (x) => Text(
                " مكونات البرنامج تشمل: تقييم صحة القلب و التعرف على عوامل الخطورة و قياس نسبة الخطورة للإصابة بأمراض القلب. التحقق من الحالة الصحية و القدرة الجسدية على ممارسة الرياضة وآداء الأنشطة البدنية.كذلك يهتم برنامج مكني بالتثقيف الصحي حول صحة القلب، بما في ذلك الإقلاع عن التدخين، النظام الغذائي، النشاط البدني و الصحة النفسية.",
                style: TextStyle(height: 2),
              ),
            ),
            ...aboutMakeny.subTopic.map(
              (x) => Text(
                " يستهدف برنامج مكني لإعادة تأهيل المرضى الذين يعانون من أمراض القلب مثل قصور القلب، الجلطات القلبية أو أصيبوا مؤخرًا بنوبة قلبية أو أجريت لهم تركيب دعامات أو خضعوا لعمليات القلب المفتوح مثل عملية تغيير شرايين القلب أو تبديل الصمامات أو الذين تم لهم زراعة أجهزة داعمة أو المعرضين لخطر الإصابة بنوبة قلبية",
                style: TextStyle(height: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
