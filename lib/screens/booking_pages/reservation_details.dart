import 'package:flutter/material.dart';
import 'package:makeny/widgets/defualt_appbar.dart';

class ReservationDetails extends StatelessWidget {
  const ReservationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(context, title: "تفاصيل الحجز"),
      body: Column(
        children: [
          //TODO
        ],
      ),
    );
  }
}
