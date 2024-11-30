import 'package:flutter/material.dart';
import 'package:makeny/models/doctor_model.dart';
import 'package:makeny/screens/doctor_profile_screen.dart';

Widget doctorContainer(
  final context, {
  required final DoctorModel doctorsData,
  required final Color textBackColor,
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
            SizedBox(
              width: MediaQuery.of(context).size.width * .5 - 12,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  doctorsData.drImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.47,
                ),
                padding: const EdgeInsets.fromLTRB(8, 2, 4, 2),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(2),
                  ),
                  color: textBackColor,
                ),
                child: Text(
                  doctorsData.drRole,
                  style: const TextStyle(
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
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}
