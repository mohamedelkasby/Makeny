// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// // instance of fireStore
// FirebaseFirestore fireStore = FirebaseFirestore.instance;

// CollectionReference users = FirebaseFirestore.instance.collection('users');

// Future<void> creatNewUser(UserCredential userCredential) async {
//   try {
//     await fireStore.collection("users").doc(userCredential.user!.uid).set({
//       "uid": userCredential.user!.uid,
//       "email": userCredential.user!.email,
//       "userName": userCredential.user!.email!.split('@')[0],
//     });
//   } catch (e) {
//     e.toString();
//     print(e.toString());
//   }
// }

// //store phoneNumber
// Future<void> storeWithNumber(
//     String phoneNo, UserCredential userCredential) async {
//   try {
//     await fireStore.collection('users').doc(userCredential.user!.uid).set({
//       'phoneNumber': phoneNo,
//     });
//   } catch (e) {
//     e.toString();
//     print(e.toString());
//   }
// }
