import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/about_Us_screen.dart';
import 'package:makeny/screens/medical_educate_head_screeen.dart';
import 'package:makeny/screens/medical_file.dart';
import 'package:makeny/screens/services_screen.dart';
import 'package:makeny/screens/user_pages/profile_page.dart';
import 'package:makeny/widgets/close_dialog.dart';
import 'package:makeny/widgets/edite_name_dialog.dart';
import 'package:makeny/widgets/text_icon_navigator.dart';
import 'package:makeny/widgets/transition_between_pages.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    String userName = "طلال أحمد عبداللطيف";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          //////// the top user image with the user name and his phone ///
          Row(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),

                      /// the user image
                      child: Image.asset(
                        'assets/users/talaa.jpg',
                        width: 65,
                        height: 65,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ///// the icon that stacked in the bottom of the user image
                  Positioned(
                    bottom: 0,
                    right: 30,
                    child: Container(
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: EdgeInsets.all(3),
                      child: SvgPicture.asset(
                        'assets/icons/cam.svg',
                      ),
                    ),
                  ),
                ],
              ),
              //// the user name and his phone with the icon .
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => transitionBetweenPages(
                      context,
                      thePage: editNameDialoge(context, name: userName),
                    ),
                    child: Row(
                      children: [
                        Text(
                          userName,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          'assets/icons/edit.svg',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  const Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      "+953 5454154451",
                      style: TextStyle(
                          color: Color(0xff777777),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              )
            ],
          ),

          ///////////  the body Start  ////////////

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 18,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textIconNavigator(
                    icon: "assets/icons/user.svg",
                    text: "الملف الشخصي",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    }),
                textIconNavigator(
                    icon: "assets/icons/files-medical 1.svg",
                    text: "ملفي الطبي",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MedicalFile(),
                          ));
                    }),
                textIconNavigator(
                  icon: "assets/icons/Medical-Education.svg",
                  text: "النثقيف الطبي",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicalEducateHeadScreen(),
                    ),
                  ),
                ),
                textIconNavigator(
                    icon: "assets/icons/ser.svg",
                    text: "خدماتنا",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServicesScreen(),
                          ));
                    }),
                textIconNavigator(
                  icon: "assets/icons/about.svg",
                  text: "عن مكني",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutUsScreen(),
                      ),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "الإعدادات",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffA2A2A2A2),
                    ),
                  ),
                ),
                textIconNavigator(
                  icon: "assets/icons/lan.svg",
                  text: "اللغة",
                  subText: "Change to english",
                  onTap: () {},
                ),
                textIconNavigator(
                  icon: "assets/icons/logout.svg",
                  text: "تسجيل الخروج ",
                  showIcon: false,
                  onTap: () => transitionBetweenPages(
                    context,
                    thePage: closeDialog(context),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
