import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makeny/cubits/cubit.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/chat_pages/chat_screen.dart';
import 'package:makeny/screens/user_pages/sign_in_&_sign_up_pages/login_screen.dart';
import 'package:makeny/services/auth_service.dart';
import 'package:makeny/widgets/internet_connectivity_wrapper.dart';

class DoctorHomePage extends StatefulWidget {
  const DoctorHomePage({super.key});

  @override
  State<DoctorHomePage> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  @override
  void initState() {
    AppCubit.get(context).saveLooged("doctor");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    FirebaseAuth fireAuth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      InternetConnectivityWrapper(child: LoginScreen()),
                ));
            AuthServices().signOut();
          },
          icon: Icon(
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
      body: Column(
        children: [
          //logo
          StreamBuilder(
            stream: fireStore.collection("users").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text("has Error"));
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: snapshot.data!.docs.map<Widget>((doc) {
                      Map<String, dynamic> data = doc.data();
                      if (fireAuth.currentUser!.email != data["email"]) {
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
                          title: Text(data["userName"] ?? data["phoneNumber"]),
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
                        return Container();
                      }
                    }).toList(),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
