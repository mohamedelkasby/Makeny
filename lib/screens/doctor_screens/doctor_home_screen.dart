import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makeny/cubits/cubit.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/chat_pages/chat_screen.dart';
import 'package:makeny/screens/user_pages/sign_in_&_sign_up_screens/login_screen.dart';
import 'package:makeny/services/auth_service.dart';
import 'package:makeny/widgets/internet_connectivity_wrapper.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  @override
  void initState() {
    AppCubit.get(context).saveLogged("doctor");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // show the top status and bottom controllers
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom
    ]); // Show status bar
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    // FirebaseAuth fireAuth = FirebaseAuth.instance;
    int userGreen = 0;
    int userRed = 0;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const InternetConnectivityWrapper(child: LoginScreen()),
                ));
            AuthServices().signOut();
          },
          icon: const Icon(
            Icons.exit_to_app,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "patients Room",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: mainColor,
      ),
      body: StreamBuilder(
        stream: fireStore.collection("users").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: snapshot.data!.docs.map<Widget>((document) {
                  Map<String, dynamic> data = document.data();
                  return StreamBuilder(
                    stream: fireStore
                        .collection("users")
                        .doc(document.id)
                        .collection("consultations")
                        .snapshots(),
                    builder: (context, consultationSnapshot) {
                      if (consultationSnapshot.hasError) {
                        return const Text('Something went wrong');
                      } else if (consultationSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Container();
                      } else {
                        return Column(
                          children: consultationSnapshot.data!.docs
                              .map<Widget>((consultationDocument) {
                            Map<String, dynamic> consultationData =
                                consultationDocument.data();

                            if (consultationData['doctorEmail'] ==
                                FirebaseAuth.instance.currentUser!.email) {
                              userGreen++;
                              print("userRed:$userRed\nuserGreen:$userGreen");

                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: data["isPatient"]
                                      ? mainColor100
                                      : Colors.green[100],
                                  child: data["picture"] == ""
                                      ? const Icon(Icons.person)
                                      : Image.asset(data["picture"]),
                                ),
                                // here i put if the email is null put the phone number cause he could sign in with phone number only
                                title: Text(
                                    data["userName"] ?? data["phoneNumber"]),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            InternetConnectivityWrapper(
                                          child: ChatScreen(
                                            // the chat Id
                                            receiverData: data,
                                          ),
                                        ),
                                      ));
                                },
                              );
                            } else {
                              userRed++;
                              print("userRed:$userRed\nuserGreen:$userGreen");
                              return const SizedBox();
                            }
                          }).toList(),
                        );
                      }
                    },
                  );
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
