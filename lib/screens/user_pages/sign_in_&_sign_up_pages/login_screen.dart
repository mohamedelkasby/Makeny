import 'package:flutter/material.dart';
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
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(.7),

                    ///////////   box shadow    //////////////

                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(116, 200, 150, 200),
                        spreadRadius: .1,
                        blurRadius: 20,
                      ),
                    ],
                    // backgroundBlendMode: BlendMode.screen,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "تسجيل دخول",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            defaultTextForm(
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
                                    builder: (context) => ConfirmLoginScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: mainColor,
                                ),
                                height: 50,
                                width: 60,
                                child: MaterialButton(
                                    onPressed: () {}, child: SizedBox()),
                              ),
                              Positioned(
                                left: 5,
                                child: Image.asset(
                                  "assets/icons/Vector.png",
                                  width: 50,
                                  // fit: BoxFit/.fill,
                                ),
                              )
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
                              icon: "assets/icons/google.png"),
                          SizedBox(
                            width: 10,
                          ),
                          signButton(
                              onTap: () {},
                              text: "Facebook",
                              icon: "assets/icons/2021_Facebook_icon 1.png"),
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
            ],
          ),
        ],
      ),
    );
  }
}
