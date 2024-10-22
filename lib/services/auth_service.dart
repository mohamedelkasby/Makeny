import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthServices {
  // instance of authentication
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //instance of fireStore
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

// sign up with email and password
  Future<UserCredential> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final credential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    //store the data to fireStore
    fireStore.collection("users").doc(credential.user!.uid).set({
      "uid": credential.user!.uid,
      "email": credential.user!.email,
      "userName": credential.user!.email!.split('@')[0],
    });
    return credential;
  }

//sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final credential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    //enter data to firebase
    //store the data to fireStore
    fireStore.collection("users").doc(credential.user!.uid).set({
      "uid": credential.user!.uid,
      "email": credential.user!.email,
      "userName": credential.user!.email!.split('@')[0],
    }, SetOptions(merge: true));
    return credential;
  }

//sign in with phone number
  signInWithPhoneNumber({
    required String phoneNumber,
    required Function(String) onCodeSent,
  }) async {
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (credential) {
        // await firebaseAuth.signInWithCredential(credential);
      },
      verificationFailed: (e) {
        // if (e.code == 'invalid-phone-number') {
        //   print('The provided phone number is not valid.');
        // }
      },
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
        }, SetOptions(merge: true));

        return 'success';
      } else {
        return 'Error in OTP';
      }
    } catch (e) {
      return e.toString();
    }
  }

// sign up with google account

// sign in with google account

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

  Future<void> authenticationWithGoogle(context) async {
    try {
      await signInWithGoogle();
    } on NoGoogleAccountChoosenException {
      return;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('there is unKnwon error'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }
// sign up with facebook account

// sign in with facebook account

// sign out
  signOut() async {
    await firebaseAuth.signOut();
  }
}

// error
class NoGoogleAccountChoosenException implements Exception {
  const NoGoogleAccountChoosenException();
}
