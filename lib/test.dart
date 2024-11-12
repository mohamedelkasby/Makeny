// auth_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/screens/basic_page.dart';
import 'package:makeny/screens/doctor_home_page.dart';
import 'package:makeny/widgets/buttons.dart';
import 'package:makeny/widgets/internet_connectivity_wrapper.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Check if user exists in Firestore
  Future<bool> doesUserExist(String email) async {
    QuerySnapshot userQuery = await _firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    return userQuery.docs.isNotEmpty;
  }

  // Get user type (patient/doctor)
  Future<bool> getUserType(String uid) async {
    DocumentSnapshot userDoc =
        await _firestore.collection('users').doc(uid).get();
    return userDoc['isPatient'];
  }

  // Create new user document
  Future<void> createUserDocument(User user) async {
    await _firestore.collection('users').doc(user.uid).set({
      "uid": user.uid,
      "email": user.email,
      "userName": user.displayName ?? user.email!.split('@')[0],
      "birthDate": "",
      "gender": "",
      "phoneNumber": user.phoneNumber ?? "",
      "idNumber": "",
      "educationLevel": "",
      "currentJob": "",
      "length": 0,
      "weight": 0,
      "waist": 0,
      "vision": "",
      "picture": "",
      "maritalStatus": "",
      "isPatient": true, // Default to patient type
    });
  }

  // Sign in with Google
  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await _auth.signInWithCredential(credential);
  }
}

// auth_buttons.dart
class AuthButtons extends StatefulWidget {
  const AuthButtons({super.key});

  @override
  _AuthButtonsState createState() => _AuthButtonsState();
}

class _AuthButtonsState extends State<AuthButtons> {
  final AuthService _authService = AuthService();
  bool isLoading = false;
  bool isEmailValid = true;
  final formKey = GlobalKey<FormState>();

  // Sign In Button
  Widget buildSignInButton() {
    return signButton(
      onTap: () async {
        try {
          setState(() {
            isLoading = true;
          });

          // Attempt Google Sign In
          final userCredential = await _authService.signInWithGoogle();
          if (userCredential == null) {
            setState(() {
              isLoading = false;
            });
            return;
          }

          // Check if user exists in Firestore
          bool userExists =
              await _authService.doesUserExist(userCredential.user!.email!);

          if (!userExists) {
            setState(() {
              isLoading = false;
            });
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Account not found. Please sign up first.'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
            return;
          }

          // Get user type and navigate
          bool isPatient =
              await _authService.getUserType(userCredential.user!.uid);

          setState(() {
            isLoading = false;
          });

          if (mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => isPatient
                    ? InternetConnectivityWrapper(child: BasicPage())
                    : const InternetConnectivityWrapper(
                        child: DoctorHomePage()),
              ),
            );
          }
        } on FirebaseAuthException catch (e) {
          _handleFirebaseAuthError(e);
        } catch (e) {
          _handleGenericError();
        }
      },
      text: "Google",
      icon: "assets/icons/google.svg",
    );
  }

  // Sign Up Button
  Widget buildSignUpButton() {
    return signButton(
      onTap: () async {
        try {
          setState(() {
            isLoading = true;
          });

          // Attempt Google Sign In
          final userCredential = await _authService.signInWithGoogle();
          if (userCredential == null) {
            setState(() {
              isLoading = false;
            });
            return;
          }

          // Check if user already exists
          bool userExists =
              await _authService.doesUserExist(userCredential.user!.email!);

          if (userExists) {
            setState(() {
              isLoading = false;
            });
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content:
                      Text('Account already exists. Please sign in instead.'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
            return;
          }

          // Create new user document
          await _authService.createUserDocument(userCredential.user!);

          setState(() {
            isLoading = false;
          });

          if (mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => InternetConnectivityWrapper(
                  child: BasicPage(),
                ),
              ),
            );
          }
        } on FirebaseAuthException catch (e) {
          _handleFirebaseAuthError(e);
        } catch (e) {
          _handleGenericError();
        }
      },
      text: "Google",
      icon: "assets/icons/google.svg",
    );
  }

  // Error Handlers
  void _handleFirebaseAuthError(FirebaseAuthException e) {
    setState(() {
      isLoading = false;
    });

    if (e.code == 'invalid-credential') {
      isEmailValid = false;
      formKey.currentState!.validate();
    } else if (e.code == 'network-request-failed') {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('لا يوجد اتصال بالإنترنت'),
            backgroundColor: mainColor300,
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  void _handleGenericError() {
    setState(() {
      isLoading = false;
    });
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
