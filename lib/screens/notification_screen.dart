import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makeny/cubits/notificationCubit/cubit/notification_cubit.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/extentions/extentions.dart';
import 'package:makeny/widgets/cusotm_notification.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(),
      child: Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          // backgroundColor: Colors.white,
          leadingWidth: 50,
          //this important to keep the status bar in basic screen not black
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
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
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  "assets/icons/close.svg",
                  width: 16,
                ),
              ),
            )
          ],
          centerTitle: true,
          title: textNormal(
            text: tr("notification").capitalizeByWord(),
          ),
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 2),
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
      ),
    );
  }
}
