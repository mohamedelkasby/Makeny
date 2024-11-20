import 'package:flutter/material.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/defualt_appbar.dart';

class SuccessPayment extends StatelessWidget {
  const SuccessPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffF4FBFF),
          appBar: defaultAppbar(context, title: "تم الحجز بنجاح"),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Column(
              children: [
                Expanded(
                    child: Center(
                  child: Container(
                    child: Image.asset("assets/success payment.png"),
                  ),
                )),
                defaultButton(
                    text: "الذهاب الى الاستشاره",
                    onTap: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);

                      //TODO
                    })
              ],
            ),
          )),
    );
  }
}
