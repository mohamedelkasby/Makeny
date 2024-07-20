import 'package:flutter/material.dart';
import 'package:makeny/models/doctor_model.dart';
import 'package:makeny/screens/doctor_profile_screen.dart';

Widget doctorContainer(
  context, {
  required DoctorsData doctorsData,
  required Color textBackColor,
}) {
  return InkWell(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DoctorProfileScreen(doctorsData: doctorsData),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .5 - 12,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber,
              ),
              child: Image.asset(
                doctorsData.drImage,

                ///
                ///
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(8, 2, 4, 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(2),
                  ),
                  color: textBackColor,
                ),
                child: Text(
                  doctorsData.drRole,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.5,
                    fontWeight: FontWeight.w500,
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            )
          ],
        ),
        Text(
          doctorsData.drName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}
