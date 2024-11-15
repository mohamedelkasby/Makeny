// // auth_service.dart
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:makeny/extentions/colors.dart';
// import 'package:makeny/screens/basic_page.dart';
// import 'package:makeny/screens/doctor_home_page.dart';
// import 'package:makeny/widgets/buttons.dart';
// import 'package:makeny/widgets/internet_connectivity_wrapper.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Existing methods...

//   // Facebook Sign In
//   Future<UserCredential?> signInWithFacebook() async {
//     try {
//       // Trigger the Facebook sign-in flow
//       final LoginResult loginResult = await FacebookAuth.instance.login(
//         permissions: ['email', 'public_profile'],
//       );

//       if (loginResult.status != LoginStatus.success) {
//         return null;
//       }

//       // Get user data
//       final AccessToken accessToken = loginResult.accessToken!;
//       final userData = await FacebookAuth.instance.getUserData();

//       // Create a credential from the access token
//       final OAuthCredential credential = FacebookAuthProvider.credential(
//         loginResult.accessToken!.tokenString,
//       );

//       // Sign in to Firebase with the Facebook credential
//       return await _auth.signInWithCredential(credential);
//     } catch (e) {
//       print('Facebook sign in error: $e');
//       await FacebookAuth.instance.logOut();
//       rethrow;
//     }
//   }

//   // Check if user exists in Firestore
//   Future<bool> doesUserExist(String email) async {
//     QuerySnapshot userQuery = await _firestore
//         .collection('users')
//         .where('email', isEqualTo: email)
//         .get();
//     return userQuery.docs.isNotEmpty;
//   }

//   // Create new user document
//   Future<void> createUserDocument(User user, {bool isPatient = true}) async {
//     await _firestore.collection('users').doc(user.uid).set({
//       "uid": user.uid,
//       "email": user.email,
//       "userName": user.displayName ?? user.email!.split('@')[0],
//       "birthDate": "",
//       "gender": "",
//       "phoneNumber": user.phoneNumber ?? "",
//       "idNumber": "",
//       "educationLevel": "",
//       "currentJob": "",
//       "length": 0,
//       "weight": 0,
//       "waist": 0,
//       "vision": "",
//       "picture":
//           user.photoURL ?? "", // Facebook users often have a profile picture
//       "maritalStatus": "",
//       "isPatient": isPatient,
//     });
//   }

//   // Get user type
//   Future<bool> getUserType(String uid) async {
//     DocumentSnapshot userDoc =
//         await _firestore.collection('users').doc(uid).get();
//     return userDoc['isPatient'];
//   }
// }

// // facebook_auth_buttons.dart
// class FacebookAuthButtons extends StatefulWidget {
//   @override
//   _FacebookAuthButtonsState createState() => _FacebookAuthButtonsState();
// }

// class _FacebookAuthButtonsState extends State<FacebookAuthButtons> {
//   final AuthService _authService = AuthService();
//   bool isLoading = false;

//   // Sign In Button
//   Widget buildFacebookSignInButton() {
//     return signButton(
//       onTap: () async {
//         try {
//           setState(() {
//             isLoading = true;
//           });

//           // Attempt Facebook Sign In
//           final userCredential = await _authService.signInWithFacebook();
//           if (userCredential == null) {
//             setState(() {
//               isLoading = false;
//             });
//             return;
//           }

//           // Check if user exists in Firestore
//           bool userExists =
//               await _authService.doesUserExist(userCredential.user!.email!);

//           if (!userExists) {
//             setState(() {
//               isLoading = false;
//             });
//             if (mounted) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   content: Text('Account not found. Please sign up first.'),
//                   duration: Duration(seconds: 2),
//                 ),
//               );
//             }
//             await FacebookAuth.instance.logOut();
//             await FirebaseAuth.instance.signOut();
//             return;
//           }

//           // Get user type and navigate
//           bool isPatient =
//               await _authService.getUserType(userCredential.user!.uid);

//           setState(() {
//             isLoading = false;
//           });

//           if (mounted) {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => isPatient
//                     ? InternetConnectivityWrapper(child: BasicPage())
//                     : const InternetConnectivityWrapper(
//                         child: DoctorHomePage()),
//               ),
//             );
//           }
//         } on FirebaseAuthException catch (e) {
//           _handleFirebaseAuthError(e);
//         } catch (e) {
//           _handleGenericError(e);
//         }
//       },
//       text: "Facebook",
//       icon: "assets/icons/facebook.svg",
//     );
//   }

//   // Sign Up Button
//   Widget buildFacebookSignUpButton() {
//     return signButton(
//       onTap: () async {
//         try {
//           setState(() {
//             isLoading = true;
//           });

//           // Attempt Facebook Sign In
//           final userCredential = await _authService.signInWithFacebook();
//           if (userCredential == null) {
//             setState(() {
//               isLoading = false;
//             });
//             return;
//           }

//           // Check if user already exists
//           bool userExists =
//               await _authService.doesUserExist(userCredential.user!.email!);

//           if (userExists) {
//             setState(() {
//               isLoading = false;
//             });
//             if (mounted) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   content:
//                       Text('Account already exists. Please sign in instead.'),
//                   duration: Duration(seconds: 2),
//                 ),
//               );
//             }
//             await FacebookAuth.instance.logOut();
//             await FirebaseAuth.instance.signOut();
//             return;
//           }

//           // Create new user document
//           await _authService.createUserDocument(userCredential.user!);

//           setState(() {
//             isLoading = false;
//           });

//           if (mounted) {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => InternetConnectivityWrapper(
//                   child: BasicPage(),
//                 ),
//               ),
//             );
//           }
//         } on FirebaseAuthException catch (e) {
//           _handleFirebaseAuthError(e);
//         } catch (e) {
//           _handleGenericError(e);
//         }
//       },
//       text: "Facebook",
//       icon: "assets/icons/facebook.svg",
//     );
//   }

//   // Error Handlers
//   void _handleFirebaseAuthError(FirebaseAuthException e) async {
//     setState(() {
//       isLoading = false;
//     });

//     await FacebookAuth.instance.logOut();
//     await FirebaseAuth.instance.signOut();

//     if (mounted) {
//       String message = 'An error occurred. Please try again.';

//       if (e.code == 'account-exists-with-different-credential') {
//         message = 'This email is already associated with another account.';
//       } else if (e.code == 'invalid-credential') {
//         message = 'Invalid Facebook credentials.';
//       } else if (e.code == 'operation-not-allowed') {
//         message = 'Facebook sign in is not enabled.';
//       } else if (e.code == 'user-disabled') {
//         message = 'This account has been disabled.';
//       } else if (e.code == 'network-request-failed') {
//         message = 'لا يوجد اتصال بالإنترنت';
//       }

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(message),
//           backgroundColor: mainColor300,
//           duration: Duration(seconds: 2),
//         ),
//       );
//     }
//   }

//   void _handleGenericError(dynamic e) async {
//     setState(() {
//       isLoading = false;
//     });

//     await FacebookAuth.instance.logOut();
//     await FirebaseAuth.instance.signOut();

//     if (mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('An error occurred. Please try again.'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }

// void _showErrorSnackBar(BuildContext context, String message) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text(
//         message,
//         textAlign: TextAlign.right, // For RTL languages
//         style: const TextStyle(
//           fontFamily: 'Arabic', // Ensure Arabic text renders properly
//         ),
//       ),
//       duration: const Duration(seconds: 2),
//       behavior:
//           SnackBarBehavior.floating, // Makes it float above bottom nav bars
//       margin: const EdgeInsets.all(8), // Adds some padding from screen edges
//     ),
//   );
// }
///