import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/user_pages/sign_in_&_sign_up_pages/login_screen.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/default_text_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      /////
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
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
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
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(.75),

                          ///////////   box shadow    //////////////

                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Color.fromARGB(116, 200, 150, 200),
                          //     spreadRadius: .1,
                          //     blurRadius: 20,
                          //   ),
                          // ],
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Center(
                              child: Text(
                                "انشاء حساب",
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            DefaultTextForm(
                              label: 'الاسم',
                            ),
                            DefaultTextForm(
                              label: 'رقم هاتفك',
                            ),
                            DefaultTextForm(
                                label: 'كلمة المرور',
                                icon: Icon(
                                  Icons.visibility_off,
                                  color: greyColor,
                                )),
                            SizedBox(
                              height: 18,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: longSignButton(
                                    text: "تسجيل",
                                    onTap: () {},
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 22,
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
                              height: 22,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "لديك حساب؟",
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
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "تسجيل دخول",
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
