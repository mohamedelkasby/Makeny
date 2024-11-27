import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:makeny/models/user_model.dart';
import 'package:makeny/screens/user_pages/edit_user_profile.dart';
import 'package:makeny/services/fire_store_service.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/internet_connectivity_wrapper.dart';
import 'package:makeny/widgets/users_data.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

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
          return Center(child: Text(tr("error.no_user_date_found")));
        }

        // Accessing the UserModel directly
        UserModel userModel = snapshot.data!;
        int age = calculateAge(userModel.birthDate!.toDate());

        return Scaffold(
          appBar:
              defaultAppbar(context, title: tr("accountPage.personla_profile")),
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
                        textType: tr("accountPage.name"),
                        textData: userModel.name,
                      ),
                      usersData(
                        textType: tr("accountPage.age"),
                        textData: "$age  ${tr("calculates.years_old")}",
                      ),
                      usersData(
                        textType: tr("accountPage.marital_status"),
                        textData: userModel.maritalStatus == ""
                            ? "-"
                            : userModel.maritalStatus,
                      ),
                      usersData(
                        textType: tr("accountPage.gender"),
                        textData:
                            userModel.gender == "" ? "-" : userModel.gender,
                      ),
                      usersData(
                        textType: tr("accountPage.email"),
                        textData: userModel.email,
                      ),
                      usersData(
                        textType: tr("accountPage.phone_number"),
                        textData: userModel.phoneNumber == ""
                            ? "-"
                            : userModel.phoneNumber,
                      ),
                      usersData(
                        textType: tr("accountPage.id_number"),
                        textData:
                            "${userModel.idNumber == 0 ? "-" : userModel.idNumber}",
                      ),
                      usersData(
                        textType: tr("accountPage.education_level"),
                        textData: userModel.educationLevel == ""
                            ? "-"
                            : userModel.educationLevel,
                      ),
                      usersData(
                        textType: tr("accountPage.current_job"),
                        textData: userModel.currentJob == ""
                            ? "-"
                            : userModel.currentJob,
                      ),
                      usersData(
                        textType: tr("accountPage.tall"),
                        textData:
                            "${userModel.length == 0 ? "-" : userModel.length} ${tr("calculates.cm")}",
                      ),
                      usersData(
                        textType: tr("accountPage.wight"),
                        textData:
                            "${userModel.weight == 0 ? "-" : userModel.weight} ${tr("calculates.kg")}",
                      ),
                      usersData(
                        textType: tr("accountPage.waist"),
                        textData:
                            "${userModel.waist == 0 ? "-" : userModel.waist} ${tr("calculates.cm")}",
                      ),
                      usersData(
                        textType: tr("accountPage.vision"),
                        textData:
                            userModel.vision == "" ? "-" : userModel.vision,
                      ),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
                defaultButton(
                  text: tr("accountPage.download"),
                  onTap: () {},
                ),
                defaultButton(
                  text: tr("accountPage.edit_data"),
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
