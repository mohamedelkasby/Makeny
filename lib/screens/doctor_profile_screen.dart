import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/models/doctor_model.dart';
import 'package:makeny/models/medical_educate_model.dart';
import 'package:makeny/screens/danger_measure_screen.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/icon_with_circle_background.dart';

class DoctorProfileScreen extends StatelessWidget {
  final DoctorsData doctorsData;
  const DoctorProfileScreen({
    super.key,
    required this.doctorsData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///////  the appbar ///////
      appBar: defaultAppbar(context, title: "ملف الطبيب"),
      body: Stack(
        //// stack to put the background to the page
        children: [
          ///// the background start////
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [mainColor, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [.23, .2],
              ),
            ),
          ),
          ///// the background end ////

          /////// the body of the page start  ////////
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      ////// the top or second background  ////////
                      ///////// the  container that holdes the doctor image and experiment ///////////
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        /* if the flex not working probarity on diff screens
                          put the mediaquery then insted of it */
                        // MediaQuery.of(context).size.height *.5,
                        decoration: BoxDecoration(
                          color: Color(0xffF3FAFF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      /////////////////
                      ///
                      Column(
                        children: [
                          //// the image ///
                          Padding(
                            padding: const EdgeInsets.all(18),
                            child: CircleAvatar(
                              radius: 42,
                              foregroundImage: AssetImage(
                                doctorsData.drImage,
                              ),
                            ),
                          ),
                          ////////// the name of the doctor   //////////
                          Text(
                            doctorsData.drName,
                            style: TextStyle(
                              fontSize: 14,
                              color: textColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          /////////// the role of the doctor  ///////////
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              doctorsData.drRole,
                              style: TextStyle(
                                fontSize: 12,
                                color: textColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          /////////////// the line divide the doctor with the icons /////////
                          Divider(
                            color: mainColor50,
                            indent: 18,
                            endIndent: 18,
                            height: 30,
                          ),
                          ///////////// the custom icons with it's text  /////////
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 28),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                circleIcon(
                                  icon: Icons.shield_outlined,
                                  topText: doctorsData.experience,
                                  bottomText: "خبرة",
                                ),
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: circleIcon(
                                    icon: Icons.star_outline_rounded,
                                    topText: "4.8",
                                    bottomText: "تقييم",
                                    withIcon: true,
                                  ),
                                ),
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: circleIcon(
                                    icon: Icons.chat_bubble_outline,
                                    topText: "105 +",
                                    bottomText: "رأي",
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: textHeadLine(text: "عن الطبيب"),
                  ),
                ),
                //////////////   make a square dot before the text
                // ListTile(
                //   leading: Text("\u2022"),
                //   title:Text("data"),
                // )
                Text.rich(
                  TextSpan(
                    children: [
                      ...doctorsData.aboutDrTobics
                          .map((topics) => TextSpan(text: "\u2022 $topics\n"))
                          .toList(),
                    ],
                  ),
                  style: TextStyle(
                    color: greyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                defaultButton(
                  text: "حجز موعد",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DangerMeasureScreen(),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 15,
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
