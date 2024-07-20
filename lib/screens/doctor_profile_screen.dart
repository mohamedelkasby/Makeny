import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/models/doctor_model.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';

class DoctorProfileScreen extends StatelessWidget {
  final DoctorsData doctorsData;
  const DoctorProfileScreen({
    super.key,
    required this.doctorsData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back_ios_rounded),
        centerTitle: true,
        title: textNormal(
          text: "ملف الطبيب",
        ),
      ),
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
                stops: [.3, .3],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: mainColor100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      foregroundImage: AssetImage(
                        doctorsData.drImage,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
