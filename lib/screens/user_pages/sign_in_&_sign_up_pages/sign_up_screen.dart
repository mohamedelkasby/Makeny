import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makeny/cubits/cubit.dart';
import 'package:makeny/cubits/status.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/basic_page.dart';
import 'package:makeny/screens/user_pages/sign_in_&_sign_up_pages/login_screen.dart';
import 'package:makeny/services/auth_service.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/default_text_form.dart';
import 'package:makeny/widgets/internet_connectivity_wrapper.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confPassController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool emailInUse = false;
  AuthServices authServices = AuthServices();

  final FocusNode _focusNode = FocusNode();
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  bool isLoading = false;

  @override
  void dispose() {
    _focusNode.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // the center progress indicator.
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: GestureDetector(
          onTap: () {
            if (_focusNode.hasFocus) {
              _focusNode.unfocus();
            }
            if (_focusNode1.hasFocus) {
              _focusNode1.unfocus();
            }
            if (_focusNode2.hasFocus) {
              _focusNode2.unfocus();
            }
            if (_focusNode3.hasFocus) {
              _focusNode3.unfocus();
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
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
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
                            filter:
                                ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(.75),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 20),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Form(
                                    key: formKey,
                                    child: Column(
                                      children: [
                                        const Center(
                                          child: Text(
                                            "انشاء حساب",
                                            style: TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        DefaultTextForm(
                                          onchange: (value) {
                                            emailInUse = false;
                                          },
                                          focusNode: _focusNode,
                                          label: 'البريد',
                                          controller: emailController,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'يرجى إدخال البريد الإلكتروني';
                                            } else if (!RegExp(
                                                    r'^[^@]+@[^@]+\.[^@]+')
                                                .hasMatch(value)) {
                                              return 'يرجى إدخال بريد إلكتروني صحيح';
                                            } else if (emailInUse) {
                                              return "البريد الإلكترونى مستخدم بالفعل";
                                            }
                                            return null;
                                          },
                                        ),
                                        DefaultTextForm(
                                          focusNode: _focusNode1,
                                          label: 'رقم هاتفك',
                                          keyboardTybe: TextInputType.phone,
                                          controller: phoneController,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'يرجى إدخال رقم الهاتف';
                                            } else if (value.length < 10) {
                                              return 'يجب أن يكون رقم الهاتف مكونًا من 10 أرقام على الأقل';
                                            }
                                            return null;
                                          },
                                        ),
                                        BlocBuilder<AppCubit, AppState>(
                                          builder: (context, state) {
                                            return Column(
                                              children: [
                                                DefaultTextForm(
                                                  focusNode: _focusNode2,
                                                  label: "كلمة المرور",
                                                  controller: passController,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'يرجى ادخال كلمة المرور';
                                                    } else if (value.length <
                                                        8) {
                                                      return 'كلمة المرور لا بجب ان تقل عن 8 احرف';
                                                    }
                                                    return null;
                                                  },
                                                  icon: IconButton(
                                                    icon: Icon(
                                                      AppCubit.get(context)
                                                              .secure1
                                                          ? Icons.visibility_off
                                                          : Icons.visibility,
                                                    ),
                                                    onPressed: () {
                                                      AppCubit.get(context)
                                                          .isSecure1();
                                                    },
                                                  ),
                                                  obscure: AppCubit.get(context)
                                                      .secure1,
                                                ),
                                                DefaultTextForm(
                                                  focusNode: _focusNode3,
                                                  label: "تأكيد كلمة المرور",
                                                  controller:
                                                      confPassController,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'يرجى ادخال كلمة المرور';
                                                    } else if (confPassController
                                                            .text !=
                                                        passController.text) {
                                                      return 'كلمة المرور غير متطابقة';
                                                    }
                                                    return null;
                                                  },
                                                  icon: IconButton(
                                                    icon: Icon(
                                                      AppCubit.get(context)
                                                              .secure2
                                                          ? Icons.visibility_off
                                                          : Icons.visibility,
                                                    ),
                                                    onPressed: () {
                                                      AppCubit.get(context)
                                                          .isSecure2();
                                                    },
                                                  ),
                                                  obscure: AppCubit.get(context)
                                                      .secure2,
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: longSignButton(
                                      text: "تسجيل",
                                      onTap: () async {
                                        if (formKey.currentState!.validate()) {
                                          // check the internt connection
                                          // if (!await checkInternet()) {
                                          //   return;
                                          // }
                                          // TODO: do the sign up auth
                                          try {
                                            setState(() {
                                              isLoading = true;
                                            });
                                            await authServices
                                                .signUpWithEmailAndPassword(
                                              email: emailController.text,
                                              password: passController.text,
                                              phoneNumber: phoneController.text,
                                            );
                                            setState(() {
                                              isLoading = false;
                                            });
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      InternetConnectivityWrapper(
                                                          child:
                                                              const LoginScreen()),
                                                ));
                                          } on FirebaseAuthException catch (e) {
                                            setState(() {
                                              isLoading = false;
                                            });
                                            if (e.code == 'weak-password') {
                                              print(
                                                  'The password provided is too weak.');
                                            } else if (e.code ==
                                                'email-already-in-use') {
                                              emailInUse = true;
                                              formKey.currentState!.validate();

                                              print(
                                                  'The account already exists for that email.');
                                            } else if (e.code ==
                                                'network-request-failed') {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: const Text(
                                                      'لا يوجد اتصال بالإنترنت'),
                                                  backgroundColor: mainColor300,
                                                  duration:
                                                      Duration(seconds: 3),
                                                ),
                                              );
                                            }
                                          } catch (e) {
                                            print(e);
                                          }
                                        }
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 22,
                                  ),
                                  Row(
                                    children: [
                                      signButton(
                                          onTap: () async {
                                            try {
                                              setState(() {
                                                isLoading = true;
                                              });

                                              // Attempt Google Sign In
                                              final userCredential =
                                                  await authServices
                                                      .signInWithGoogle();
                                              if (userCredential == null) {
                                                setState(() {
                                                  isLoading = false;
                                                });
                                                return;
                                              }
                                              bool userExists =
                                                  await authServices
                                                      .doesUserExist(
                                                          userCredential
                                                              .user!.email!);

                                              if (userExists) {
                                                setState(() {
                                                  isLoading = false;
                                                });
                                                if (mounted) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                          'الاكونت موجود بالفعل, جرب تسجل دخول'),
                                                      duration:
                                                          Duration(seconds: 2),
                                                    ),
                                                  );
                                                }

                                                return;
                                              }
                                              await authServices
                                                  .createUserDocument(
                                                      userCredential.user!);

                                              setState(() {
                                                isLoading = false;
                                              });

                                              if (mounted) {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        InternetConnectivityWrapper(
                                                      child: BasicPage(),
                                                    ),
                                                  ),
                                                );
                                              }
                                            } on FirebaseAuthException catch (e) {
                                              setState(() {
                                                isLoading = false;
                                              });
                                              if (e.code ==
                                                  'network-request-failed') {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: const Text(
                                                        'لا يوجد اتصال بالإنترنت'),
                                                    backgroundColor:
                                                        mainColor300,
                                                    duration:
                                                        Duration(seconds: 2),
                                                  ),
                                                );
                                              }
                                            } catch (e) {
                                              setState(() {
                                                isLoading = false;
                                              });
                                              if (mounted) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        'An error occurred. Please try again.'),
                                                    duration:
                                                        Duration(seconds: 2),
                                                  ),
                                                );
                                              }
                                            }
                                          },
                                          text: "Google",
                                          icon: "assets/icons/google.svg"),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      signButton(
                                          onTap: () {},
                                          text: "Facebook",
                                          icon: "assets/icons/facebook.svg"),
                                    ],
                                  ),
                                  const SizedBox(
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
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const InternetConnectivityWrapper(
                                                      child: LoginScreen()),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
