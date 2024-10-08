import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/helper/helper_functions.dart';
import 'package:flutter_boilerplate/viewmodels/base_viewmodel.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class HomeScreenViewModel extends BaseViewModel {
  final _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  String verificationID = '';
  Future<void> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final  facebookCredential =
            FacebookAuthProvider.credential(
                result.accessToken?.tokenString ?? '');
        final  user =
            await FirebaseAuth.instance.signInWithCredential(facebookCredential);
        HelperFunctions().logger("${user.user?.email}");
      } else {
        HelperFunctions().logger('Facebook login failed: ${result.message}');
      }
    } catch (e) {
      HelperFunctions().logger("Exception -> $e");
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final user =
            await FirebaseAuth.instance.signInWithCredential(credential);

        HelperFunctions().logger("${user.user?.email}");
      } else {
        HelperFunctions().logger('Google login failed');
      }
    } catch (e) {
      HelperFunctions().logger("Exception -> $e");
    }
  }

  Future<void> signInAnonymous() async {
    try {
      final user = await _auth.signInAnonymously();
      HelperFunctions().logger(user.user?.uid ?? '');
    } catch (e) {
      HelperFunctions().logger("Exception-> $e");
    }
  }

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        try {
          await FirebaseAuth.instance.signInWithCredential(credential);
        } catch (e) {
          HelperFunctions().logger("Sign in failed -> $e");
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        verificationID = verificationId;
        updateUI();
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationID = verificationId;
        updateUI();
      },
      timeout: const Duration(milliseconds: 10000),
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          HelperFunctions().logger('Invalid phone number');
        } else if (e.code == 'too-many-requests') {
          HelperFunctions()
              .logger('Too many requests. Please try again later.');
        } else {
          HelperFunctions().logger("Exception -> $e");
        }
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var user = await _auth.signInWithCredential(PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otp));
    HelperFunctions().logger(user.toString());
    return user.user != null ? true : false;
  }

  Future<void> signUpWithEmailPass() async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passController.text);
      HelperFunctions().logger(user.user.toString());
    } catch (e) {
      HelperFunctions().logger("Exception-> $e");
    }
  }

  Future<void> signInWithEmailPass() async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: emailController.text, password: passController.text);
      HelperFunctions().logger(user.user.toString());
    } catch (e) {
      HelperFunctions().logger("Exception-> $e");
    }
  }
}
