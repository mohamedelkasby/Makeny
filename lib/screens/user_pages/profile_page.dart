import 'package:flutter/material.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/users_data.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/id 1.png',
                    width: 70,
                    fit: BoxFit.cover,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UsersData(
                      textType: "الاسم بالكامل",
                      textData: "طلال أحمد عبداللطيف",
                    ),
                    UsersData(
                      textType: "السن",
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
                      textType: "رقم الهويه",
                      textData: "297 030 901517",
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
              Expanded(child: SizedBox()),
              defaultButton(
                text: "حمل ك pdf",
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
