import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/image_constant.dart';
import 'package:flutter_boilerplate/models/response/user_model.dart';
import 'package:flutter_boilerplate/models/widgets/common_icon_button_model.dart';
import 'package:flutter_boilerplate/services/firebase_services/firebase_auth.dart';
import 'package:flutter_boilerplate/services/firebase_services/firebase_databse.dart';
import 'package:flutter_boilerplate/utils/validation/validation_functions.dart';
import 'package:flutter_boilerplate/viewmodels/base_viewmodel.dart';

class RegistrationScreenViewModel extends BaseViewModel {
  final ImageConstant imageConstant = ImageConstant();
  final formKey = GlobalKey<FormState>();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final FirebaseAuthServices firebaseAuthServices = FirebaseAuthServices();
  final FirebaseDatabaseService firebaseDatabaseService =
      FirebaseDatabaseService();

  bool rememberMe = false;
  bool isDisable = true;

  late List<CommonIconButtonModel> iconButtonList = [
    CommonIconButtonModel(
      image: imageConstant.googleIcon,
      onTap: () async {
        await signInWithGoogle();
      },
    ),
    CommonIconButtonModel(
      image: imageConstant.facebookIcon,
      onTap: () async {
        await signInWithFacebook();
      },
    ),
    CommonIconButtonModel(
      image: imageConstant.twitterIcon,
      onTap: () async {
        await signInWithTwitter();
      },
    )
  ];
  String? numberValidation(String value) {
    return Validations().validatePhone(value);
  }

  String? emailValidation(String value) {
    return Validations().validateEmail(value);
  }

  String? nameValidation(String value) {
    return Validations().validateName(value);
  }

  void buttonDisable() {
    if (numberController.text.length == 10 &&
        emailController.text.isNotEmpty &&
        nameController.text.isNotEmpty) {
      isDisable = false;
      updateUI();
    } else {
      isDisable = true;
      updateUI();
    }
  }

  Future<void> signInWithGoogle() async {
    final user = await firebaseAuthServices.signInWithGoogle();
    await firebaseDatabaseService.setUser(
        userModel: UserModel(
            email: user?.user?.email ?? '',
            name: user?.user?.displayName ?? '',
            number: user?.user?.phoneNumber ?? ''));
  }

  Future<void> signInWithFacebook() async {
    final user = await firebaseAuthServices.signInWithFacebook();
    await firebaseDatabaseService.setUser(
        userModel: UserModel(
            email: user?.user?.email ?? '',
            name: user?.user?.displayName ?? '',
            number: user?.user?.phoneNumber ?? ''));
  }

  Future<void> signInWithTwitter() async {
    final user = await firebaseAuthServices.signInWithTwitter();
    await firebaseDatabaseService.setUser(
        userModel: UserModel(
            email: user?.user?.email ?? '',
            name: user?.user?.displayName ?? '',
            number: user?.user?.phoneNumber ?? ''));
  }

  void onSumbit() {
    if (formKey.currentState?.validate() ?? false) {}
  }
}
