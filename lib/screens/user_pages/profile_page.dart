import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:makeny/models/user_model.dart';
import 'package:makeny/screens/user_pages/edit_user_profile.dart';
import 'package:makeny/services/fire_store_service.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/internet_connectivity_wrapper.dart';
import 'package:makeny/widgets/users_data.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;

    // Check if birthday hasn't occurred this year
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }

    return age;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
      future: FireStoreService().getUserDetails(
        userID: firebaseAuth.currentUser!.uid,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        if (!snapshot.hasData) {
          return Center(child: Text("No user data found"));
        }

        // Accessing the UserModel directly
        UserModel userModel = snapshot.data!;
        int age = calculateAge(userModel.birthDate!.toDate());

        return Scaffold(
          appBar: defaultAppbar(context, title: "الملف الشخصي"),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              children: [
                // Replace with user profile image or default image
                Image.asset(
                  'assets/id 1.png',
                  width: 55,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 12),

                // Displaying user data
                Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      usersData(
                        textType: "الاسم",
                        textData: userModel.name,
                      ),
                      usersData(
                        textType: "العمر",
                        textData: "$age سنة",
                      ),
                      usersData(
                        textType: "الحالة الاجتماعيه",
                        textData: userModel.maritalStatus == ""
                            ? "-"
                            : userModel.maritalStatus,
                      ),
                      usersData(
                        textType: "النوع",
                        textData:
                            userModel.gender == "" ? "-" : userModel.gender,
                      ),
                      usersData(
                        textType: "البريد الالكتروني",
                        textData: userModel.email,
                      ),
                      usersData(
                        textType: "رقم الهاتف",
                        textData: userModel.phoneNumber == ""
                            ? "-"
                            : userModel.phoneNumber,
                      ),
                      usersData(
                        textType: "رقم الهوية",
                        textData:
                            "${userModel.idNumber == 0 ? "-" : userModel.idNumber}",
                      ),
                      usersData(
                        textType: "المستوى التعليمي",
                        textData: userModel.educationLevel == ""
                            ? "-"
                            : userModel.educationLevel,
                      ),
                      usersData(
                        textType: "العمل الحالي",
                        textData: userModel.currentJob == ""
                            ? "-"
                            : userModel.currentJob,
                      ),
                      usersData(
                        textType: "الطول",
                        textData:
                            "${userModel.length == 0 ? "-" : userModel.length} سم",
                      ),
                      usersData(
                        textType: "الوزن",
                        textData:
                            "${userModel.weight == 0 ? "-" : userModel.weight} كيلو",
                      ),
                      usersData(
                        textType: "الخصر",
                        textData:
                            "${userModel.waist == 0 ? "-" : userModel.waist} سم",
                      ),
                      usersData(
                        textType: "النظر",
                        textData:
                            userModel.vision == "" ? "-" : userModel.vision,
                      ),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
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
                      builder: (context) => InternetConnectivityWrapper(
                          child: EditUserProfile(data: userModel)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
