import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/user_pages/sign_in_&_sign_up_pages/confirm_login_screen.dart';
import 'package:makeny/screens/user_pages/sign_in_&_sign_up_pages/signUp_screen.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/default_text_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [mainColor, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [.7, .1],
              ),
            ),
          ),
          Positioned(
            left: 0,
            child: Image.asset(
              "assets/designs/Star.png",
              // width: 400,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Image.asset('assets/logo/logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        blurRadius: 20,
                        spreadRadius: -8,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 10.0),
                      child: Container(
                        color: Colors.white.withOpacity(0.75),
                        padding:
                            EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                        width: double.infinity,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      "تسجيل دخول",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  DefaultTextForm(
                                      label: "رقم الهاتف",
                                      hintText: "رقم الهاتف او البريد")
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: longSignButton(
                                    text: "دخول",
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ConfirmLoginScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Stack(
                                  // alignment: Alignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.zero,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: mainColor,
                                      ),
                                      height: 50,
                                      width: 50,
                                    ),
                                    Positioned(
                                      top: 0,
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Transform.scale(
                                        scale: .8,
                                        child: SvgPicture.asset(
                                          "assets/icons/fingerprint.svg",
                                          height: 40,
                                          /////////// search for alternative for color down
                                          colorFilter: ColorFilter.mode(
                                            Colors.white,
                                            BlendMode.srcIn,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                signButton(
                                    onTap: () {},
                                    text: "Google",
                                    icon: "assets/icons/google.svg"),
                                SizedBox(
                                  width: 10,
                                ),
                                signButton(
                                    onTap: () {},
                                    text: "Facebook",
                                    icon: "assets/icons/facebook.svg"),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "لا تملك حساب؟",
                                  style: TextStyle(
                                    color: greyColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                      builder: (context) => SignUpScreen(),
                                    ));
                                  },
                                  child: Text(
                                    "سجل الان",
                                    style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
