import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makeny/cubits/cubit.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/doctor_screens/control_screen.dart';
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

  // to make this page refresh when pop the next page .
  void navigateWithRefresh({
    required userData,
    required conId,
  }) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InternetConnectivityWrapper(
          child: ControlScreen(
            pathientData: userData,
            consultationId: conId,
          ),
        ),
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    FirebaseFirestore fireStore = FirebaseFirestore.instance;

    return SafeArea(
      child: Scaffold(
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
          title: Text(
            tr("doctor_page.patients_room"),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          backgroundColor: mainColor,
        ),
        body: StreamBuilder(
          stream: fireStore.collection("users").snapshots(),
          builder: (context, userSnapshot) {
            if (userSnapshot.hasError) {
              return Center(child: Text(tr("error.problem_try_later")));
            }

            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            return StreamBuilder<List<Widget>>(
              stream: Stream.fromFuture(
                  _generatePatientWidgets(userSnapshot.data!.docs)),
              builder: (context, widgetsSnapshot) {
                if (widgetsSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                // Get the list of patient widgets
                List<Widget> patientWidgets = widgetsSnapshot.data ?? [];

                // Check if there are any patient widgets
                if (patientWidgets.isEmpty) {
                  return Center(
                    child: Text(
                      tr("doctor_page.no_patient_data"),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  );
                }

                // If there are patient widgets, display them
                return SingleChildScrollView(
                  child: Column(
                    children: patientWidgets,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<List<Widget>> _generatePatientWidgets(
      List<QueryDocumentSnapshot> userDocs) async {
    List<Widget> patientWidgets = [];
    FirebaseFirestore fireStore = FirebaseFirestore.instance;

    for (var document in userDocs) {
      Map<String, dynamic> userData = document.data() as Map<String, dynamic>;
      // Fetch consultations for this user
      var consultationSnapshot = await fireStore
          .collection("users")
          .doc(document.id)
          .collection("consultations")
          .get();

      // Filter consultations for current doctor
      var relevantConsultations =
          consultationSnapshot.docs.where((consultationDoc) {
        Map<String, dynamic> consultationData = consultationDoc.data();
        return consultationData['doctorEmail'] ==
                FirebaseAuth.instance.currentUser!.email &&
            consultationData['status'] != tr('canceled');
      });

      // Create widgets for relevant consultations
      for (var consulDoc in relevantConsultations) {
        patientWidgets.add(
          ListTile(
            leading: CircleAvatar(
              backgroundColor: mainColor100,
              child: userData["picture"] == ""
                  ? const Icon(Icons.person)
                  : Image.asset(userData["picture"]),
            ),
            title: Text(userData["userName"] ?? userData["phoneNumber"]),
            onTap: () {
              navigateWithRefresh(
                conId: consulDoc.id,
                userData: userData,
              );
            },
          ),
        );
      }
    }

    return patientWidgets;
  }
}
