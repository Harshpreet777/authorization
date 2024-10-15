import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/image_constant.dart';
import 'package:flutter_boilerplate/constants/key_constant.dart';
import 'package:flutter_boilerplate/constants/string_constant.dart';
import 'package:flutter_boilerplate/models/widgets/common_button_model.dart';
import 'package:flutter_boilerplate/utils/helper/helper_functions.dart';
import 'package:flutter_boilerplate/viewmodels/base_viewmodel.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

class AuthTestScreenViewModel extends BaseViewModel {
  final _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final StringConstants stringConstants = StringConstants();
  final ImageConstant imageConstant = ImageConstant();
  final HelperFunctions helperFunctions = HelperFunctions();
  final KeyConstants keyConstants = KeyConstants();

  late List<CommonButtonModel> buttonList = [
    CommonButtonModel(
        title: stringConstants.google,
        image: imageConstant.googleIcon,
        onPressed: () async {
          await signInWithGoogle();
        }),
    CommonButtonModel(
        title: stringConstants.facebook,
        image: imageConstant.facebookIcon,
        onPressed: () async {
          await signInWithFacebook();
        }),
    CommonButtonModel(
        title: stringConstants.anonymous,
        image: imageConstant.anonymousIcon,
        onPressed: () async {
          await signInAnonymous();
        }),
    CommonButtonModel(
        title: stringConstants.mobileNo,
        image: imageConstant.phoneIcon,
        onPressed: () async {
          await verifyPhoneNumber("+918510913274");
        }),
    CommonButtonModel(
      title: stringConstants.microsoft,
      image: imageConstant.microsoftIcon,
      onPressed: () async {
        await signInWithMicrosoft();
      },
    ),
    CommonButtonModel(
      title: stringConstants.twitter,
      image: imageConstant.twitterIcon,
      onPressed: () async {
        await signInWithTwitter();
      },
    ),
    CommonButtonModel(
      title: stringConstants.github,
      image: imageConstant.githubIcon,
      onPressed: () async {
        await signInWithGithub();
      },
    )
  ];

  String verificationID = '';
  Future<void> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      final accessToken = result.accessToken?.tokenString ?? "";
      if (result.status == LoginStatus.success) {
        final facebookCredential = FacebookAuthProvider.credential(accessToken);
        final user = await FirebaseAuth.instance
            .signInWithCredential(facebookCredential);
        helperFunctions.logger("${user.user?.email}");
      } else {
        helperFunctions.logger('Facebook login failed: ${result.message}');
      }
    } catch (e) {
      helperFunctions.logger("Exception -> $e");
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

        helperFunctions.logger("${user.user?.email}");
      } else {
        helperFunctions.logger('Google login failed');
      }
    } catch (e) {
      helperFunctions.logger("Exception -> $e");
    }
  }

  Future<void> signInAnonymous() async {
    try {
      final user = await _auth.signInAnonymously();
      helperFunctions.logger(user.user?.uid ?? '');
    } catch (e) {
      helperFunctions.logger("Exception-> $e");
    }
  }

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        try {
          await FirebaseAuth.instance.signInWithCredential(credential);
        } catch (e) {
          helperFunctions.logger("Sign in failed -> $e");
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
          helperFunctions.logger('Invalid phone number');
        } else if (e.code == 'too-many-requests') {
          helperFunctions.logger('Too many requests. Please try again later.');
        } else {
          helperFunctions.logger("Exception -> $e");
        }
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var user = await _auth.signInWithCredential(PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otp));
    helperFunctions.logger(user.toString());
    return user.user != null ? true : false;
  }

  Future<void> signUpWithEmailPass() async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passController.text);
      helperFunctions.logger(user.user.toString());
    } catch (e) {
      helperFunctions.logger("Exception-> $e");
    }
  }

  Future<void> signInWithEmailPass() async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: emailController.text, password: passController.text);
      helperFunctions.logger(user.user.toString());
    } catch (e) {
      helperFunctions.logger("Exception-> $e");
    }
  }

  Future<void> signInWithMicrosoft() async {
    try {
      final provider = OAuthProvider("microsoft.com");
      provider.setCustomParameters({"tenant": keyConstants.microsoftTenantKey});
      provider.addScope("openid");
      final user = await FirebaseAuth.instance.signInWithProvider(provider);
      helperFunctions.logger(user.user.toString());
    } catch (e) {
      helperFunctions.logger("Exception-> $e");
    }
  }

  Future<void> signInWithTwitter() async {
    try {
      final twitterLogin = TwitterLogin(
          apiKey: keyConstants.twitterApiKey,
          apiSecretKey: keyConstants.twitterSecretApiKey,
          redirectURI: "twittersdk://");
      final authResult = await twitterLogin.login();
      if (authResult.status == TwitterLoginStatus.loggedIn) {
        final AuthCredential twitterAuthCredential =
            TwitterAuthProvider.credential(
                accessToken: authResult.authToken!,
                secret: authResult.authTokenSecret!);

        final user = await _auth.signInWithCredential(twitterAuthCredential);
        HelperFunctions().logger(user.toString());
      }
    } catch (e) {
      helperFunctions.logger("Exception -> $e");
    }
  }

  Future<void> signInWithGithub() async {
    try {
      final GithubAuthProvider githubAuthProvider = GithubAuthProvider();
      final user = await _auth.signInWithProvider(githubAuthProvider);
      helperFunctions.logger(user.toString());
    } catch (e) {
      helperFunctions.logger("Exception -> $e");
    }
  }
}
