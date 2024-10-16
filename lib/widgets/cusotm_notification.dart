import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makeny/cubits/cubit.dart';
import 'package:makeny/cubits/notificationCubit/cubit/notification_cubit.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';

// ignore: must_be_immutable
class CustomNotification extends StatelessWidget {
  CustomNotification({
    super.key,
    required this.text,
    required this.subText,
    this.image = "",
    this.svgIcon = "",
    this.newNotification = true,
  });
  final String text;
  final String subText;
  final String image;
  final String svgIcon;
  bool newNotification;

  @override
  Widget build(BuildContext context) {
    NotificationCubit cubit = NotificationCubit.get(context);

    // bool newNotification = cubit.newNotification;
    final Color forgroundColor =
        newNotification == true ? mainColor400 : greyborderColor;
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: InkWell(
            onTap: () {
              newNotification == true
                  ? newNotification = cubit.notificationClicked(newNotification)
                  : newNotification = false;
              context.read<AppCubit>();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color:
                    newNotification == true ? mainColor50 : greybackgroundColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: greyborderColor,
                    blurRadius: 4.5,
                    spreadRadius: -4,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Container(
                      //   width: 50,
                      //   height: 50,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(150),
                      //     color: newNotification ? Color(0xffFFD4DD) : Color(0xffE5E5E5),
                      //   ),
                      // ),
                      Stack(
                        children: [
                          image == ""
                              ? CircleAvatar(
                                  radius: 25,
                                  backgroundColor: newNotification
                                      ? Color(0xffFFD4DD)
                                      : Color(0xffE5E5E5),
                                )
                              : CircleAvatar(
                                  radius: 25,
                                  foregroundImage: AssetImage(
                                    image,
                                  ),
                                ),

                          ///   search how to center a positined in stack <========
                          svgIcon == ""
                              ? SizedBox()
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: svgIcon ==
                                            "assets/icons/Medical-Education.svg"
                                        ? 13
                                        : 8,
                                  ),
                                  child: SvgPicture.asset(
                                    svgIcon,
                                    colorFilter: ColorFilter.mode(
                                        newNotification == true
                                            ? mainColor
                                            : greyColor,
                                        BlendMode.srcIn),
                                    height: 30,
                                  ),
                                ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textHeadLine(
                              text: text,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              subText,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: forgroundColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "منذ 5 ث",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: forgroundColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
