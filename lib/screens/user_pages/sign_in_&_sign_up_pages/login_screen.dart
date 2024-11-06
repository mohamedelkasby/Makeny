import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makeny/cubits/cubit.dart';
import 'package:makeny/cubits/status.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/basic_page.dart';
import 'package:makeny/screens/doctor_home_page.dart';
import 'package:makeny/screens/patient_home_page.dart';
import 'package:makeny/screens/user_pages/sign_in_&_sign_up_pages/confirm_login_screen.dart';
import 'package:makeny/screens/user_pages/sign_in_&_sign_up_pages/sign_up_screen.dart';
import 'package:makeny/services/auth_service.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/default_text_form.dart';
import 'package:country_picker/country_picker.dart';
import 'package:makeny/widgets/internet_connectivity_wrapper.dart';
import 'package:makeny/widgets/resizable_country_picker_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  // make the default country is suadi arabia
  Country country = CountryParser.parseCountryCode("SA");
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController inputController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final AuthServices authServices = AuthServices();
  bool isEmailValiad = true;
  bool isPhoneNumber = true;
  bool isLoading = false;

  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  late final Animation<double> animation = CurvedAnimation(
    parent: animationController,
    curve: Curves.easeInOut,
  );

  void showResizableCountryPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return ResizableCountryPicker(
          onSelect: (Country country) {
            setState(() {
              this.country = country;
            });
            Navigator.of(context).pop();
          },
          countryListTheme: CountryListThemeData(
            bottomSheetHeight: MediaQuery.of(context).size.height * 0.5,
            bottomSheetWidth: MediaQuery.of(context).size.width * 0.9,
            borderRadius: BorderRadius.circular(10),
            backgroundColor: mainColor50,
            inputDecoration: InputDecoration(
              border: InputBorder.none,
              hintText: "search your country here",
              prefixIcon: Icon(Icons.search),
            ),
          ),
        );
      },
    );
  }
  //////

  sendOTP() async {
    try {
      setState(() {
        isLoading = true;
      });
      await authServices.signInWithPhoneNumber(
        phoneNumber: "+${country.phoneCode}${inputController.text}",
        onCodeSent: (String verId) {
          setState(() {
            isLoading = false;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ConfirmLoginScreen(verification: verId),
            ),
          );
        },
        onVerificationFailed: (FirebaseAuthException e) {
          setState(() {
            isLoading = false;
          });
          // You can show an error message here if needed
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.code == 'network-request-failed'
                  ? 'لا يوجد اتصال بالإنترنت'
                  : 'رقم الهاتف غير صحيح'),
              backgroundColor: mainColor300,
            ),
          );
        },
      );
    } catch (e) {
      print("...this error when send OTP ... $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // show the top status and bottom controllers
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom
    ]); // Show status bar
    //

    //while writing on the field it listens to the changes.
    void onInputChanged() {
      final bool isEmail =
          RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(inputController.text);
      if (isEmail) {
        animationController.forward();
        setState(() {
          isPhoneNumber = false;
        });
      } else {
        animationController.reverse();
        setState(() {
          isPhoneNumber = true;
        });
      }
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            Expanded(
              child: ModalProgressHUD(
                inAsyncCall: isLoading,
                child: GestureDetector(
                  onTap: () {
                    if (FocusScope.of(context).hasFocus) {
                      FocusScope.of(context).unfocus(); // Dismiss the keyboard
                    }
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [mainColor, Colors.white],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: const [.7, .1],
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
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 40),
                              child: Image.asset('assets/logo/logo.png'),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
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
                                    filter: ImageFilter.blur(
                                        sigmaX: 2.0, sigmaY: 10.0),
                                    child: Container(
                                      color: Colors.white.withOpacity(0.75),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 40, horizontal: 10),
                                      width: double.infinity,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Form(
                                              key: formKey,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Center(
                                                    child: Text(
                                                      "تسجيل دخول",
                                                      style: TextStyle(
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  DefaultTextForm(
                                                    onchange: (value) {
                                                      isEmailValiad = true;
                                                      onInputChanged();
                                                    },
                                                    label:
                                                        "رقم الهاتف او البريد",
                                                    hintText: "",
                                                    controller: inputController,
                                                    icon: isPhoneNumber
                                                        ? GestureDetector(
                                                            onTap: () {
                                                              showResizableCountryPicker(
                                                                  context);
                                                            },
                                                            child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 10),
                                                              width: 80,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                "${country.flagEmoji} +${country.phoneCode}",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 17,
                                                                  color:
                                                                      mainBlack,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        : const SizedBox(),
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return "إدخل رقم هاتفك او البريد الخاص بك";
                                                      } else if (isEmailValiad ==
                                                          false) {
                                                        return "البريد الالكترونى او الباسورد غير صحيح.";
                                                      } else if ((value.length <
                                                                  7 ||
                                                              value.length >
                                                                  15) &&
                                                          isPhoneNumber) {
                                                        return "إدخل رقم الهاتف صحيح";
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                  SizeTransition(
                                                    sizeFactor: animation,
                                                    axisAlignment: -1,
                                                    child: BlocBuilder<AppCubit,
                                                        AppState>(
                                                      builder:
                                                          (context, state) {
                                                        return DefaultTextForm(
                                                          onchange: (value) {
                                                            isEmailValiad =
                                                                true;
                                                          },
                                                          label: "كلمة المرور",
                                                          controller:
                                                              passController,
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return "ادخل كلمة المرور من فضلك.";
                                                            } else if (value
                                                                    .length <
                                                                8) {
                                                              return 'كلمة المرور لا بجب ان تقل عن 8 احرف';
                                                            }
                                                            return null;
                                                          },
                                                          icon: IconButton(
                                                            icon: Icon(
                                                              AppCubit.get(
                                                                          context)
                                                                      .secure
                                                                  ? Icons
                                                                      .visibility_off
                                                                  : Icons
                                                                      .visibility,
                                                            ),
                                                            onPressed: () {
                                                              AppCubit.get(
                                                                      context)
                                                                  .isSecure();
                                                            },
                                                          ),
                                                          obscure: AppCubit.get(
                                                                  context)
                                                              .secure,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: longSignButton(
                                                  text: "دخول",
                                                  onTap: () async {
                                                    // if (!await checkInternet()) {
                                                    //   return;
                                                    // }
                                                    if (formKey.currentState!
                                                        .validate()) {
                                                      if (!isPhoneNumber) {
                                                        try {
                                                          setState(() {
                                                            isLoading = true;
                                                          });

                                                          await authServices
                                                              .signInWithEmailAndPassword(
                                                            email:
                                                                inputController
                                                                    .text,
                                                            password:
                                                                passController
                                                                    .text,
                                                          );
                                                          User? user =
                                                              FirebaseAuth
                                                                  .instance
                                                                  .currentUser;

                                                          if (user != null) {
                                                            DocumentSnapshot
                                                                userDoc =
                                                                await FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        'users')
                                                                    .doc(user
                                                                        .uid)
                                                                    .get();
                                                            bool userType =
                                                                userDoc[
                                                                    'isPatient'];
                                                            setState(() {
                                                              isLoading = false;
                                                            });
                                                            if (mounted) {
                                                              setState(() {
                                                                isLoading =
                                                                    false;
                                                              });
                                                              Navigator
                                                                  .pushReplacement(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => userType
                                                                      ? InternetConnectivityWrapper(
                                                                          child:
                                                                              BasicPage())
                                                                      : const InternetConnectivityWrapper(
                                                                          child:
                                                                              DoctorHomePage()),
                                                                ),
                                                              );
                                                            }
                                                          }
                                                        } on FirebaseAuthException catch (e) {
                                                          setState(() {
                                                            isLoading = false;
                                                          });
                                                          if (e.code ==
                                                              'invalid-credential') {
                                                            isEmailValiad =
                                                                false;
                                                            formKey
                                                                .currentState!
                                                                .validate();
                                                          } else if (e.code ==
                                                              'network-request-failed') {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: const Text(
                                                                    'لا يوجد اتصال بالإنترنت'),
                                                                backgroundColor:
                                                                    mainColor300,
                                                                duration:
                                                                    Duration(
                                                                        seconds:
                                                                            2),
                                                              ),
                                                            );
                                                          }
                                                        }
                                                      }
                                                    } else {
                                                      if (inputController.text
                                                                  .length >=
                                                              7 &&
                                                          inputController.text
                                                                  .length <=
                                                              15) {
                                                        await sendOTP();
                                                      }
                                                    }
                                                  },
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Stack(
                                                // alignment: Alignment.center,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.zero,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
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
                                                        colorFilter:
                                                            const ColorFilter
                                                                .mode(
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
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          Row(
                                            children: [
                                              signButton(
                                                  onTap: () {
                                                    authServices
                                                        .authenticationWithGoogle(
                                                            context);
                                                  },
                                                  text: "Google",
                                                  icon:
                                                      "assets/icons/google.svg"),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              signButton(
                                                  onTap: () {},
                                                  text: "Facebook",
                                                  icon:
                                                      "assets/icons/facebook.svg"),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "لا تملك حساب؟",
                                                style: TextStyle(
                                                  color: greyColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                    builder: (context) =>
                                                        InternetConnectivityWrapper(
                                                            child:
                                                                const SignUpScreen()),
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
