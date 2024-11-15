import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makeny/models/user_model.dart';

class AuthServices {
  // instance of authentication
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //instance of fireStore
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

// sign up with email and password
  Future<UserCredential> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    final credential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    UserModel emptyUser = UserModel.empty();

    //store the data to fireStore
    fireStore.collection("users").doc(credential.user!.uid).set({
      "uid": credential.user!.uid,
      "email": email,
      "userName": credential.user!.email!.split('@')[0],
      "birthDate": emptyUser.birthDate,
      "gender": emptyUser.gender,
      "phoneNumber": phoneNumber,
      "idNumber": emptyUser.idNumber,
      "educationLevel": emptyUser.educationLevel,
      "currentJob": emptyUser.currentJob,
      "length": emptyUser.length,
      "weight": emptyUser.weight,
      "waist": emptyUser.waist,
      "vision": emptyUser.vision,
      "picture": emptyUser.picture,
      "maritalStatus": emptyUser.maritalStatus,
      "isPatient": true,
    });
    return credential;
  }

//sign in with email and password
  Future signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final credential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Define the default user model
    UserModel emptyUser = UserModel.empty();
    final userDocRef = fireStore.collection("users").doc(credential.user!.uid);
    final userDoc = await userDocRef.get();

    if (!userDoc.exists) {
      // Document does not exist, create it with empty fields
      await userDocRef.set({
        "uid": credential.user!.uid,
        "email": email,
        "userName": email.split('@')[0],
        "birthDate": emptyUser.birthDate,
        "gender": emptyUser.gender,
        "phoneNumber": emptyUser.phoneNumber,
        "idNumber": emptyUser.idNumber,
        "educationLevel": emptyUser.educationLevel,
        "currentJob": emptyUser.currentJob,
        "length": emptyUser.length,
        "weight": emptyUser.weight,
        "waist": emptyUser.waist,
        "vision": emptyUser.vision,
        "picture": emptyUser.picture,
        "maritalStatus": emptyUser.maritalStatus,
        "isPatient": emptyUser.isPatient,
      });
      // print("User document created with empty fields.");
    } else {
      // Document exists, update missing fields with empty values
      Map<String, dynamic> updatedData = {};
      final data = userDoc.data()!;

      // Check each field in UserModel and add missing ones to updatedData
      if (!data.containsKey("birthDate"))
        updatedData["birthDate"] = emptyUser.birthDate;
      if (!data.containsKey("gender")) updatedData["gender"] = emptyUser.gender;
      if (!data.containsKey("phoneNumber"))
        updatedData["phoneNumber"] = emptyUser.phoneNumber;
      if (!data.containsKey("idNumber"))
        updatedData["idNumber"] = emptyUser.idNumber;
      if (!data.containsKey("educationLevel"))
        updatedData["educationLevel"] = emptyUser.educationLevel;
      if (!data.containsKey("currentJob"))
        updatedData["currentJob"] = emptyUser.currentJob;
      if (!data.containsKey("length")) updatedData["length"] = emptyUser.length;
      if (!data.containsKey("weight")) updatedData["weight"] = emptyUser.weight;
      if (!data.containsKey("waist")) updatedData["waist"] = emptyUser.waist;
      if (!data.containsKey("vision")) updatedData["vision"] = emptyUser.vision;
      if (!data.containsKey("picture"))
        updatedData["picture"] = emptyUser.picture;
      if (!data.containsKey("maritalStatus"))
        updatedData["maritalStatus"] = emptyUser.maritalStatus;
      if (!data.containsKey("isPatient"))
        updatedData["isPatient"] = emptyUser.isPatient;

      if (updatedData.isNotEmpty) {
        await userDocRef.update(updatedData);
        // print("User document updated with missing fields.");
      }
      // else {
      //   print("All fields are already present.");
      // }
    }

    return credential;
  }

//sign in with phone number

  signInWithPhoneNumber({
    required String phoneNumber,
    required Function(String) onCodeSent,
    required Function(FirebaseAuthException) onVerificationFailed,
  }) async {
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // await firebaseAuth.signInWithCredential(credential);
      },
      verificationFailed: onVerificationFailed,
      codeSent: (String verificationId, int? resendToken) async {
        onCodeSent(verificationId);

        // // Update the UI - wait for the user to enter the SMS code
        // String smsCode = 'xxxx';

        // // Create a PhoneAuthCredential with the code
        // PhoneAuthCredential credential = PhoneAuthProvider.credential(
        //     verificationId: verificationId, smsCode: smsCode);

        // // Sign the user in (or link) with the credential
        // await firebaseAuth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (verificationId) {
        // Auto-resolution timed out...
      },
    );
  }

  // verify OTP Code
  Future<String> verifyOTPCode({
    required String verifyId,
    required String otp,
  }) async {
    try {
      PhoneAuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: verifyId,
        smsCode: otp,
      );
      final UserCredential userCredential =
          await firebaseAuth.signInWithCredential(authCredential);
      if (userCredential.user != null) {
        // store data in firebase
        fireStore.collection('users').doc(userCredential.user!.uid).set({
          'phoneNumber': userCredential.user!.phoneNumber,
          'uid': userCredential.user!.uid,
        }, SetOptions(merge: true));

        return 'success';
      } else {
        return 'Error in OTP';
      }
    } catch (e) {
      return e.toString();
    }
  }

//////////////////////////////////
// sign in and up with google
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      throw const NoGoogleAccountChoosenException();
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await firebaseAuth.signInWithCredential(credential);
  }

  // Check if user exists in Firestore
  Future<bool> doesUserExist(String email) async {
    QuerySnapshot userQuery = await fireStore
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    return userQuery.docs.isNotEmpty;
  }

  // Get user type (patient/doctor)
  Future<bool> getUserType(String uid) async {
    DocumentSnapshot userDoc =
        await fireStore.collection('users').doc(uid).get();
    return userDoc['isPatient'];
  }

// Create new user document
  Future<void> createUserDocument(User user) async {
    await fireStore.collection('users').doc(user.uid).set({
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

//  Sign In and up with facebook
  Future<UserCredential?> signInWithFacebook() async {
    try {
      // Trigger the Facebook sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login(
          // permissions: ['email', 'public_profile'],
          );

      try {
        final result = await FacebookAuth.instance.accessToken;
        print(".............................Key Hash: ${result?.tokenString}");
      } catch (e) {
        print("....................Error getting key hash: $e");
      }
      if (loginResult.status != LoginStatus.success) {
        return null;
      }

      // Create a credential from the access token
      final OAuthCredential credential = FacebookAuthProvider.credential(
        loginResult.accessToken!.tokenString,
      );
      // Sign in to Firebase with the Facebook credential
      return await firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      print('Facebook sign in error: $e');
      await FacebookAuth.instance.logOut();
      rethrow;
    }
  }

// sign out
  signOut() async {
    await firebaseAuth.signOut();
  }
}

// error
class NoGoogleAccountChoosenException implements Exception {
  const NoGoogleAccountChoosenException();
}
