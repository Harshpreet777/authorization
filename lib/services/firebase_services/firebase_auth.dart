import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_boilerplate/constants/key_constant.dart';
import 'package:flutter_boilerplate/utils/helper/helper_functions.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

class FirebaseAuthServices {
  final _auth = FirebaseAuth.instance;
  final HelperFunctions helperFunctions = HelperFunctions();
  final KeyConstants keyConstants = KeyConstants();

  Future<UserCredential?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      final accessToken = result.accessToken?.tokenString ?? "";
      if (result.status == LoginStatus.success) {
        final facebookCredential = FacebookAuthProvider.credential(accessToken);
        final user = await _auth.signInWithCredential(facebookCredential);
        helperFunctions.logger("${user.user?.email}");
        return user;
      } else {
        helperFunctions.logger('Facebook login failed: ${result.message}');
      }
    } catch (e) {
      helperFunctions.logger("Exception -> $e");
    }
    return null;
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final user = await _auth.signInWithCredential(credential);

        helperFunctions.logger("${user.user?.email}");
        return user;
      } else {
        helperFunctions.logger('Google login failed');
      }
    } catch (e) {
      helperFunctions.logger("Exception -> $e");
    }
    return null;
  }

  Future<UserCredential?> signInWithTwitter() async {
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
        return user;
      }
    } catch (e) {
      helperFunctions.logger("Exception -> $e");
    }
    return null;
  }
}
