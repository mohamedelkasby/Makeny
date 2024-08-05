import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/widgets/cusotm_notification.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 50,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.asset(
            "assets/logo/main_logo.png",
            // width: 2,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(
                "assets/icons/close.svg",
                width: 16,
              ),
            ),
          )
        ],
        centerTitle: true,
        title: textNormal(
          text: "الاشعارات",
        ),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 2),
          child: Container(
            height: 2,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              stops: [.2, .5, .8],
              colors: [
                Color(0xffE8E8E8),
                Color(0xffee5534),
                Color(0xffE8E8E8),
              ],
            )),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 5),
                child: Text(
                  "اليوم",
                  style: TextStyle(
                    color: greyColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              CustomNotification(
                image: "assets/doctors/doc.jpg",
                text: "بروف. علي البراتي",
                subText: "ارسل اليك رسالة",
                // newNotification: false,
              ),
              CustomNotification(
                svgIcon: "assets/icons/timer.svg",
                text: "اقترب موعد استشارتك!",
                subText: "استشارتك بعد 30د",
              ),
              CustomNotification(
                svgIcon: "assets/icons/timer.svg",
                text: "تم إضافة توجيهات من طبيبك",
                subText: "الرجاء الاطلاع على التوجيهات والاتزام بها.",
              ),
              CustomNotification(
                svgIcon: "assets/icons/Medical-Education.svg",
                text: "تم إضافة توجيهات من طبيبك",
                subText: "الرجاء الاطلاع على التوجيهات والاتزام بها.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
