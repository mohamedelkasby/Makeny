import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/chat_pages/chat_screen.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
import 'package:makeny/widgets/internet_connectivity_wrapper.dart';

PreferredSizeWidget defaultAppbar(
  final context, {
  required final String title,
  bool chatIcon = false,
  bool backarrow = true,
  Map<String, dynamic>? doctorfireData,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    actions: [
      chatIcon
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: mainColor50,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: InkWell(
                  onTap: () {
                    print("${doctorfireData?["userName"]}");
                    doctorfireData != null
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InternetConnectivityWrapper(
                                child: ChatScreen(receiverData: doctorfireData),
                              ),
                            ),
                          )
                        : {
                            const SnackBar(
                                content: Text(
                                    "you should enter the data of the doctor from the firebase ")),
                            print(
                                "you should enter the data of the doctor from the firebase :) :) :) :) :) :) :)")
                          };
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: SvgPicture.asset("assets/icons/chat.svg"),
                  ),
                ),
              ),
            )
          : SizedBox()
    ],
    leading: backarrow == true ? backArrow(context) : null,
    centerTitle: true,
    title: textNormal(
      text: title,
    ),
    bottom: PreferredSize(
      preferredSize: Size(double.infinity, 2),
      child: Container(
        height: 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: [.2, .5, .8],
            colors: [
              Color(0xffE8E8E8),
              Color(0xffee5534),
              Color(0xffE8E8E8),
            ],
          ),
        ),
      ),
    ),
  );
}
