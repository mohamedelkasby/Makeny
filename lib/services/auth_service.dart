import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
//firebast instance
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
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
        await storeNumber(userCredential.user!.phoneNumber!);
        return 'success';
      } else {
        return 'Error in OTP';
      }
    } catch (e) {
      return e.toString();
    }
  }

  //store phoneNumber
  Future<void> storeNumber(String phoneNo) async {
    try {
      await fireStore.collection('users').doc(phoneNo).set({
        'phoneNumber': phoneNo,
      });
    } catch (e) {
      e.toString();
    }
  }

// sign out
  signOut() async {
    await firebaseAuth.signOut();
  }

// error
}
