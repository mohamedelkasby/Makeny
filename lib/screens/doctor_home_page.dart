import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/chat_pages/chat_screen.dart';

class DoctorHomePage extends StatelessWidget {
  const DoctorHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    FirebaseAuth fireAuth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Frinds Room",
          style: TextStyle(fontWeight: FontWeight.bold),
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
                      Map<String, dynamic> data =
                          doc.data() as Map<String, dynamic>;
                      if (fireAuth.currentUser!.email != data["email"]) {
                        return ListTile(
                          // here i put if the email is null put the phone number cause he could sign in with phone number only
                          title: Text(data["email"] ?? data["phoneNumber"]),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                    // the chat Id
                                    receiverData: data,
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
