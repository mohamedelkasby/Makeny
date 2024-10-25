import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/basic_page.dart';
import 'package:makeny/services/auth_service.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ConfirmLoginScreen extends StatefulWidget {
  ConfirmLoginScreen({
    super.key,
    required this.verification,
  });
  final String verification;

  @override
  State<ConfirmLoginScreen> createState() => _ConfirmLoginScreenState();
}

class _ConfirmLoginScreenState extends State<ConfirmLoginScreen> {
  final TextEditingController controller = TextEditingController();

  String serverGeneratedCode = '';

  void generateServerCode() {
    // Generate a random 2-digit code
    serverGeneratedCode =
        (10 + (DateTime.now().millisecondsSinceEpoch % 90)).toString();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    generateServerCode();
  }

  @override
  Widget build(BuildContext context) {
    //verifyOTP
    verifyOTP() async {
      String fullCode = controller.text + serverGeneratedCode;
      print(controller.text);
      print(fullCode);

      try {
        String result = await AuthServices().verifyOTPCode(
          verifyId: widget.verification,
          otp: fullCode,
        );
        if (result == 'success') {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => BasicPage(),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('OTP Verification Failed'),
              duration: Duration(seconds: 1),
            ),
          );
        }
      } catch (e) {
        e.toString();
        setState(() {
          generateServerCode();
        });
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Stack(
            children: [
              ///////////// the top rounded background ///////
              Container(
                height: MediaQuery.of(context).size.height * .5,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              Center(
                /////////
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 65, bottom: 10),
                        child: Text(
                          "تأكيد رقمك",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Text(
                          "تم ارسال رسالة من 4 ارقام على رقمك",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      ///////////// the 4 boxes that contain digits ///
                      Row(
                        children: [
                          SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: PinCodeTextField(
                                textStyle: const TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w400,
                                ),
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                appContext: context,
                                length: 4,
                                controller: controller,
                                autoDisposeControllers: false,
                                keyboardType: TextInputType.number,
                                animationType: AnimationType.fade,
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(10),
                                  fieldHeight: 50,
                                  fieldWidth: 50,
                                  activeFillColor: Colors.white,
                                  selectedFillColor: Colors.white,
                                  inactiveFillColor: Colors.white,
                                  selectedColor: Colors.transparent,
                                  activeColor: Colors.transparent,
                                ),
                                animationDuration: Duration(milliseconds: 300),
                                backgroundColor: Colors.transparent,
                                enableActiveFill: true,
                                onCompleted: (value) {
                                  // TODO: on the code entered.
                                  print("----$value---");
                                },
                                beforeTextPaste: (text) {
                                  // Allow pasting
                                  return true;
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "لم تتللقى رساله؟",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: GestureDetector(
                                onTap: () {
                                  //TODO: resend the the code ...
                                },
                                child: Text(
                                  "إعادة إرسال",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: mainBlack,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 1),
                                ),
                              ),
                            ),
                            Text(
                              "(5ث)",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
            child: longSignButton(
              text: "تاكيد",
              onTap: () {
                verifyOTP();
              },
            ),
          )
        ],
      ),
    );
  }
}

Widget roundedWiteSquare() {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
