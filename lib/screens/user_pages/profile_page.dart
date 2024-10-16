import 'package:flutter/material.dart';
import 'package:makeny/screens/user_pages/edit_user_profile.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/users_data.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(context, title: "الملف الشخصي"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          children: [
            Image.asset(
              'assets/id 1.png',
              width: 55,
              fit: BoxFit.cover,
            ),
            ////////////////////////////////
            SizedBox(
              height: 12,
            ),
            ////////////////////////////////

            Align(
              alignment: Alignment.topRight,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    UsersData(
                      textType: "الاسم بالكامل",
                      textData: "طلال أحمد عبداللطيف",
                    ),
                    UsersData(
                      textType: "العمر",
                      textData: "35 سنة",
                    ),
                    UsersData(
                      textType: "الحاله الاجتماعية",
                      textData: "اعزب",
                    ),
                    UsersData(
                      textType: "النوع",
                      textData: "ذكر",
                    ),
                    UsersData(
                      textType: "البريد الالكتروني",
                      textData: "MOHAMED ALI.GMAIL.COM ",
                    ),
                    UsersData(
                      textType: "رقم الهاتف",
                      textData: "01213521535",
                    ),
                    UsersData(
                      textType: "رقم الهوية",
                      textData: "297 030 901517",
                    ),
                    UsersData(
                      textType: "المستوى التعليمي",
                      textData: "بكالوريوس",
                    ),
                    UsersData(
                      textType: "العمل الحالي",
                      textData: "مهندس",
                    ),
                    UsersData(
                      textType: "الطول ",
                      textData: "73 سم",
                    ),
                    UsersData(
                      textType: "الوزن ",
                      textData: "80 كيلو",
                    ),
                    UsersData(
                      textType: "الخصر ",
                      textData: "53 سم",
                    ),
                    UsersData(
                      textType: "النظر",
                      textData: "6/6",
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            defaultButton(
              text: "حمل ك pdf",
              onTap: () {},
            ),
            defaultButton(
              text: "تعديل البيانات",
              reverseColors: true,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditUserProfile(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
