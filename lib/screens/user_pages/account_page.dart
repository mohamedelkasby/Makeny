import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makeny/cubits/cubit.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/models/user_model.dart';
import 'package:makeny/screens/about_makeny/about_Us_screen.dart';
import 'package:makeny/screens/about_makeny/services_screen.dart';
import 'package:makeny/screens/medical_education_screens/medical_educate_head_screeen.dart';
import 'package:makeny/screens/user_pages/medical_file.dart';
import 'package:makeny/screens/user_pages/profile_page.dart';
import 'package:makeny/services/fire_store_service.dart';
import 'package:makeny/widgets/close_dialog.dart';
import 'package:makeny/widgets/image_preview.dart';
import 'package:makeny/widgets/internet_connectivity_wrapper.dart';
import 'package:makeny/widgets/navigation_utils.dart';
import 'package:makeny/widgets/text_icon_navigator.dart';
import 'package:makeny/widgets/transition_between_pages.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
// // For single image
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    // to refresh the page when edite the name or phone Number
    NavigationUtils.refreshPage = () {
      if (mounted) {
        setState(() {
          // Your refresh logic here
          print("Refreshing Account Page");
        });
      }
    };
  }

  @override
  void dispose() {
    NavigationUtils.refreshPage = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            //////// the top user image with the user name and his phone ///
            Row(
              children: [
                Stack(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(9),
                      child: ImagePreview(),
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
                        padding: const EdgeInsets.all(3),
                        child: SvgPicture.asset(
                          'assets/icons/cam.svg',
                        ),
                      ),
                    ),
                  ],
                ),
                //// the user name and his phone with the icon .
                FutureBuilder<UserModel>(
                    future: FireStoreService()
                        .getUserDetails(userID: auth.currentUser!.uid),
                    builder: (context, snapshot) {
                      //// i am not using if else for handling
                      UserModel? userdata = snapshot.data;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                ////TODO come here
                                userdata?.name ?? "",
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SvgPicture.asset(
                                'assets/icons/edit.svg',
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "+966 ${userdata?.phoneNumber}" == "+966 "
                                ? ""
                                : "+966 ${userdata?.phoneNumber}",
                            style: TextStyle(
                                color: Color(0xff777777),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      );
                    })
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
                      text: tr("accountPage.personla_profile"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InternetConnectivityWrapper(
                              child: ProfilePage(),
                            ),
                          ),
                        );
                      }),
                  textIconNavigator(
                      icon: "assets/icons/files-medical 1.svg",
                      text: tr("accountPage.my_medical_file"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MedicalFile(),
                            ));
                      }),
                  textIconNavigator(
                    icon: "assets/icons/Medical-Education.svg",
                    text: tr("accountPage.medical_education"),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MedicalEducateHeadScreen(),
                      ),
                    ),
                  ),
                  textIconNavigator(
                      icon: "assets/icons/ser.svg",
                      text: tr("accountPage.our_services"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ServicesScreen(),
                            ));
                      }),
                  textIconNavigator(
                    icon: "assets/icons/about.svg",
                    text: tr("accountPage.about_makeny"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutUsScreen(),
                        ),
                      );
                    },
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      tr("settings"),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffa2a2a2a2),
                      ),
                    ),
                  ),
                  textIconNavigator(
                    icon: "assets/icons/lan.svg",
                    text: tr("accountPage.language"),
                    subText: tr("accountPage.translate"),
                    onTap: () {
                      context.locale.toString() == "ar"
                          ? context.setLocale(Locale('en', ''))
                          : context.setLocale(Locale('ar', ''));

                      // AppCubit.get(context).saveLang();
                    },
                  ),
                  textIconNavigator(
                    icon: "assets/icons/logout.svg",
                    text: tr("accountPage.sign_out"),
                    showIcon: false,
                    onTap: () {
                      return transitionBetweenPages(
                        context,
                        thePage: closeDialog(context),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
