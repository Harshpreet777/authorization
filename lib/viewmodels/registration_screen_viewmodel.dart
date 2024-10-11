import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/image_constant.dart';
import 'package:flutter_boilerplate/models/widgets/common_icon_button_model.dart';
import 'package:flutter_boilerplate/utils/validation/validation_functions.dart';
import 'package:flutter_boilerplate/viewmodels/base_viewmodel.dart';

class RegistrationScreenViewModel extends BaseViewModel {
  final ImageConstant imageConstant = ImageConstant();
  final formKey = GlobalKey<FormState>();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool rememberMe = false;
  bool isDisable = true;

  late List<CommonIconButtonModel> iconButtonList = [
    CommonIconButtonModel(
      image: imageConstant.googleIcon,
      onTap: () async {},
    ),
    CommonIconButtonModel(
      image: imageConstant.facebookIcon,
      onTap: () async {},
    ),
    CommonIconButtonModel(
      image: imageConstant.twitterIcon,
      onTap: () async {},
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

  void onSumbit() {
    if (formKey.currentState?.validate() ?? false) {}
  }
}