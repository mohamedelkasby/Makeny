import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makeny/extentions/colors.dart';

Widget consultionsData(
  context, {
  required String img,
  required String specialty,
  required String docName,
  required String status,
  // required Color statusColor,
  required Widget theScreen,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => theScreen,
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffF3FAFF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    img,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        specialty,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    docName,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/icons/clock.svg"),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "9:30 ص",
                        style: TextStyle(
                          color: Color(0xff6C7380),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/icons/deta.svg"),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "2024/5/8 ",
                        style: TextStyle(
                          color: Color(0xff6C7380),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:
                              status == "ملغاه" ? mainColor : Color(0xff0EBE7F),
                        ),
                        child: SizedBox(
                          width: 10,
                          height: 10,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        status,
                        style: TextStyle(
                          color: Color(0xff6C7380),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
