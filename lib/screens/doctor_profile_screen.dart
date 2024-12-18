import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/models/doctor_model.dart';
import 'package:makeny/screens/danger_measure_screens/danger_measure_screen.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/icon_with_circle_background.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;

class DoctorProfileScreen extends StatelessWidget {
  final DoctorModel doctorsData;
  const DoctorProfileScreen({
    super.key,
    required this.doctorsData,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        ///////  the appbar ///////
        appBar: defaultAppbar(context, title: tr("doctor's_file")),
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
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Stack(
                children: [
                  ListView(
                    //// the physics is here .
                    // physics: FixedExtentScrollPhysics(),
                    children: [
                      Stack(
                        children: [
                          ////// the top or second background  ////////
                          ///////// the  container that holdes the doctor image and experiment ///////////
                          Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height *
                                ((1 / 3) + (1 / 17)),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 28),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    circleIcon(
                                      icon: "assets/icons/misc.svg",
                                      topText: doctorsData.experience,
                                      bottomText: tr("experience"),
                                    ),
                                    Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: circleIcon(
                                        icon: "assets/icons/socials.svg",
                                        topText: "4.8",
                                        bottomText: tr("rating"),
                                        withIcon: true,
                                      ),
                                    ),
                                    Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: circleIcon(
                                        icon: "assets/icons/messaging.svg",
                                        topText: "105 +",
                                        bottomText: tr("opinion"),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: textHeadLine(text: tr("about_doctor")),
                        ),
                      ),
                      //////////////   make a square dot before the text
                      ///

                      ...doctorsData.aboutDrTobics
                          .map(
                            (topics) => Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "\u2022 ",
                                  style: TextStyle(
                                    color: greyColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "$topics",
                                    style: TextStyle(
                                      color: greyColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: defaultButton(
                      text: tr("book_a_date"),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DangerMeasureScreen(
                            appbar: tr("severity_scale"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
